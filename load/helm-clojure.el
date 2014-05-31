(require 'cl-lib)
(require 'helm)
(require 'cider)


(defun helm-clojure-inject ()
  )
;; (insert (concat (plist-get c :ns) "/" (plist-get c :symbol) "\n"))

(defun helm-clojure-display (m)
  (let* ((sym (helm-substring
               (concat (plist-get m :ns) " / " (plist-get m :symbol))
               58))
         (sep (make-string (- 60 (string-width sym)) ? )))
    (propertize (concat sym sep (plist-get m :doc))
                'helm-clojure-sym sym)))

(defun helm-clojure-candidates* ()
  (let* ((res (nrepl-send-string-sync "(helm-clojure/candidates)"
                                      (cider-current-ns) (nrepl-current-tooling-session)))
         (cands (car (read-from-string (plist-get res :value)))))
    (-map 'helm-clojure-display cands)))

(defun helm-clojure-candidates ()
  (helm-clojure-inject)
  (with-helm-current-buffer (helm-clojure-candidates*)))

(defun helm-clojure-init ()
  (let ((data (helm-clojure-candidates)))
    (helm-init-candidates-in-buffer
        (nrepl-current-tooling-session) data)))

(defun helm-clojure-transformer (candidate)
  (concat candidate " OK!"))

(defun helm-clojure-highlight (c)
  c)

(defun helm-clojure-jump (c)
  (message c)
  (let ((s (next-single-property-change (point) 'helm-clojure-sym)))
    (message s)
    (cider-jump-to-def s)
    (helm-highlight-current-line)))

(defun helm-clojure-highlight-all (cands _source)
  (-map 'helm-clojure-highlight cands))

(defvar helm-source-clojure
  `((name . "Clojure")
    (init . helm-clojure-init)
    (candidates-in-buffer)
    ;; (filtered-candidate-transformer
    ;;  helm-adaptive-sort
    ;;  helm-clojure-highlight-all)
    (persistent-action . helm-clojure-jump)
    (persistent-help . "Jump to definition")
    ;; (candidates . helm-clojure-candidates)
    ;; (candidate-transformer . helm-clojure-transformer)
    ))

;; - проверить что не сломались всякие джамп бэк
(defun helm-clojure ()
  "Preconfigured `helm' for `imenu'."
  (interactive)
  (helm :sources 'helm-source-clojure
        :candidate-number-limit 9999
        :buffer "*helm clojure*"
        ;; :resume t
        ;; :resume 'noresume
        ))
