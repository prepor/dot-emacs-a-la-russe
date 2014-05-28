(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync 'org-mode)

(require 'org)
;;(org-babel-load-file (expand-file-name "init-org.org"
;;                                       (file-name-directory (buffer-file-name))))
(org-babel-load-file "/Users/prepor/.emacs.d/init-org.org")

;; (setq custom-file "~/.emacs.d/custom.el")
;; (load custom-file)

;; (setq user-emacs-directory "~/.emacs.d")

;; (setq inhibit-startup-screen +1)

;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (let (el-get-master-branch)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp))))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (setq el-get-user-package-directory "~/.emacs.d/packages/")

;; (defun add-to-path (dir)
;;   (add-to-list 'load-path
;;                (format "~/.emacs.d/%s" dir)))

;; (defun load-init (modules)
;;   "Load initialization files"
;;   (mapc (lambda (name)
;;           (load (format "%s_init" name)))
;;         modules))

;; (add-to-path 'load)
;; (load-init '("core" "packages" "holidays" "sql"))
;; (load "slamhound")

;; (global-auto-revert-mode 1)

;; (require 'image)

;; ;; org-mode
;; (require 'calendar)
;; (setq org-directory "~/Dropbox/notes")
;; (setq org-default-notes-file (concat org-directory "/captures.org"))
;; (setq org-startup-indented t)
;; (setq org-mobile-inbox-for-pull "~/Dropbox/notes/mobile.org")
;; ;; Set to <your Dropbox root directory>/MobileOrg.
;; (setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; ;; TODO вычислять автоматом исходя из ширины окна
;; (setq org-image-actual-width 500)


;; (require 'ob-clojure)
;; (setq org-babel-clojure-backend 'cider)

;; (setq org-ditaa-jar-path "~/.emacs.d/ditaa0_9.jar")
;; (setq org-plantuml-jar-path
;;       (expand-file-name "~/.emacs.d/plantuml.jar"))

;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((sql . t)
;;    (emacs-lisp . t)
;;    (sh . t)
;;    (R . t)
;;    (ruby . t)
;;    (python . t)
;;    (clojure . t)
;;    (ditaa . t)
;;    (plantuml . t)))

;; (setq org-src-fontify-natively t)
;; (setq org-confirm-babel-evaluate nil)

;;                                         ; Rebuild the reminders everytime the agenda is displayed
;; (add-hook 'org-finalize-agenda-hook 'my/org-agenda-to-appt 'append)

;;                                         ; This is at the end of my .emacs - so appointments are set up when Emacs starts
;; (my/org-agenda-to-appt)

;;                                         ; Activate appointments so we get notifications
;; (appt-activate t)

;; (setq appt-audible nil)

;; (defadvice appt-disp-window (after osx-notification
;;                                    (min-to-app new-time appt-msg))
;;   (my/notification (format "%s: %s min. (%s)" appt-msg min-to-app new-time)
;;                    "Appointment"))

;; (ad-activate 'appt-disp-window)

;;                                         ; If we leave Emacs running overnight - reset the appointments one minute after midnight
;; (run-at-time "24:01" nil 'my/org-agenda-to-appt)

;; (setq-default TeX-engine 'xetex)

;; (require 'ox-latex)
;; ;; pip install pygments
;; ;; http://joat-programmer.blogspot.ru/2013/07/org-mode-version-8-and-pdf-export-with.html
;; (setq org-latex-packages-alist
;;       '(("" "fontspec")
;;         "\\defaultfontfeatures{Ligatures=TeX}"
;;         "\\setmainfont{Linux Libertine O}"
;;         "\\setmonofont{Inconsolata}"
;;         "\\newfontfamily{\\cyrillicfontsf}{Linux Libertine O}"
;;         "\\newfontfamily{\\cyrillicfonttt}{DejaVu Sans Mono}"
;;         ("" "polyglossia")
;;         "\\setmainlanguage{russian}"
;;         "\\setotherlanguage{english}"
;;         ("" "xunicode")
;;         ("" "minted")))

;; ;; убираем inputenc и fontenc ибо у нас xelatex
;; (setq org-latex-default-packages-alist '((""     "fixltx2e"  nil)
;;                                          (""     "graphicx"  t)
;;                                          (""     "longtable" nil)
;;                                          (""     "float"     nil)
;;                                          (""     "wrapfig"   nil)
;;                                          (""     "rotating"  nil)
;;                                          ("normalem" "ulem"  t)
;;                                          (""     "amsmath"   t)
;;                                          (""     "textcomp"  t)
;;                                          (""     "marvosym"  t)
;;                                          (""     "wasysym"   t)
;;                                          (""     "amssymb"   t)
;;                                          (""     "hyperref"  nil)
;;                                          "\\tolerance=1000"))
;; (setq org-latex-listings 'minted)
;; (setq org-latex-pdf-process
;;       '("xelatex -interaction nonstopmode -output-directory %o %f"
;;         "xelatex -interaction nonstopmode -output-directory %o %f"
;;         "xelatex -interaction nonstopmode -output-directory %o %f")
;;       ;; '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;       ;;   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;       ;;   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")
;;       )

;; (setq org-entities-user
;;       '(("rao" "\\'{о}" nil "о" "о" "о" "о")))
;; (add-hook 'org-mode-hook
;;           '(lambda ()
;;              (local-set-key (kbd "M-I") 'org-toggle-inline-images)))

;; (define-key org-mode-map (kbd "C-c h") 'helm-org-headlines)

;; ;;
;; (set-input-method "russian-computer")

;; ;; не засорять директории всякими бэкапами и автосейвами, держать их в /tmp
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-tranesforms
;;       `((".*" ,temporary-file-directory t)))

;; ;; ido-mode is like magic pixie dust!
;; (ido-mode t)
;; (setq
;;  ido-auto-merge-work-directories-length -1)
;; (ido-everywhere t)

;; (setq-default indent-tabs-mode nil)

;; (setq word-wrap t)
;; (show-paren-mode -1)

;; ;; Fonts
;; (set-face-attribute 'default nil
;;                     :family "Inconsolata"
;;                     :height 140
;;                     :weight 'normal
;;                     :width 'normal)
;; (when (functionp 'set-fontset-font)
;;   (set-fontset-font "fontset-default"
;;                     'unicode
;;                     (font-spec :family "DejaVu Sans Mono"
;;                                :width 'normal
;;                                :size 12.4
;;                                :weight 'normal)))


;; ;; Formatting
;; (set-default 'fill-column 90)

;; (global-set-key (kbd "C-c n") 'my/clean-buffer-formatting)

;; (dolist (mode-hook (my/normal-mode-hooks))
;;   (add-hook mode-hook 'my/general-formatting-hooks))

;; (add-hook 'text-mode-hook
;;           'my/text-formatting-hooks)

;; (dolist (mode (mapcar 'my/->mode-hook my/lisps))
;;   (add-hook mode
;;             'my/general-lisp-hooks))

;; (setq mac-command-modifier 'meta)
;; (setq mac-option-modifier 'hyper)
;; (setq mac-right-option-modifier 'alt)

;; (define-key global-map (kbd "RET") 'newline-and-indent)

;; (setq x-select-enable-clipboard t)

;; (define-key global-map (kbd "s-c") 'clipboard-kill-ring-save)

;; (define-key global-map (kbd "H-<tab>") 'pcomplete)

;; (define-key key-translation-map (kbd "H-<tab>") (kbd "C-M-i"))

;; ;; (define-key global-map (kbd "S-v") ')

;; (global-set-key (kbd "C-x g") 'magit-status)

;; (global-set-key (kbd "<up>")     'windmove-up)
;; (global-set-key (kbd "<down>")   'windmove-down)
;; (global-set-key (kbd "<left>")   'windmove-left)
;; (global-set-key (kbd "<right>")  'windmove-right)
;; (global-set-key (kbd "C-c s")    'my/swap-windows)

;; ;; (global-set-key (kbd "<S-up>")     'buf-move-up)
;; ;; (global-set-key (kbd "<S-down>")   'buf-move-down)
;; ;; (global-set-key (kbd "<S-left>")   'buf-move-left)
;; ;; (global-set-key (kbd "<S-right>")  'buf-move-right)

;; (global-set-key (kbd "M-i") 'helm-imenu)

;; (global-set-key (kbd "C-x C-b") 'ibuffer)

;; (global-set-key (kbd "C-c SPC") 'ace-jump-mode)
;; (global-set-key (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; (global-set-key (kbd "C-c a l") 'org-store-link)
;; (global-set-key (kbd "C-c a a") 'org-agenda)
;; (global-set-key (kbd "C-c a b") 'org-iswitchb)
;; (global-set-key (kbd "C-c a c") 'org-capture)
;; (global-set-key (kbd "C-c a h") 'my/org-listing)


;; (defun my/org-listing ()
;;   (interactive)
;;   (require 'helm-files)
;;   (helm-find-files-1 "/Users/prepor/Dropbox/notes/ org "))

;; (global-set-key (kbd "C-c <SPC>") 'helm-all-mark-rings)
;; (global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)

;; ;; (global-set-key (kbd "M-/") 'comment-or-uncomment-region)

;; ;; (global-set-key (kbd "C-S-f") 'ack)

;; ;; brew install aspell --with-lang-ru --with-lang-en
;; (setq ns-pop-up-frames nil)

;; (defun my/attach (file)
;;   (require 'org-attach)
;;   (org-attach-attach file nil 'cp)
;;   (let* ((basename (file-name-nondirectory file))
;;          (attach-dir (org-attach-dir t))
;;          (fname (expand-file-name basename attach-dir)))
;;     (insert (format "[[%s]]" fname))
;;     (when (image-type-from-file-name file)
;;       (org-display-inline-images))))

;; (defun my/dnd-proxy (f)
;;   (if (eq major-mode 'org-mode)
;;       (my/attach (expand-file-name (pop ns-input-file)
;;                                    command-line-default-directory))
;;     (funcall f)))

;; (defun my/dnd-image-find ()
;;   (interactive)
;;   (my/dnd-proxy 'ns-open-file-select-line))

;; (defun my/dnd-image-drag ()
;;   (interactive)
;;   (my/dnd-proxy 'ns-find-file))

;; (define-key global-map [ns-open-file-line] 'my/dnd-image-find)
;; (define-key global-map [ns-drag-file] 'my/dnd-image-drag)

;; (server-start)

;; (put 'narrow-to-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)
;; (put 'LaTeX-narrow-to-environment 'disabled nil)
