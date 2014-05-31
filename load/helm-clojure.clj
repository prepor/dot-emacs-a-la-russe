(ns helm-clojure
  (:require [clojure.java.io :as io]))

(defprotocol Emacs
  (->emacs [v]))

(extend-protocol Emacs
  Object
  (->emacs [v]
    v)

  clojure.lang.APersistentMap
  (->emacs [m]
    (mapcat #(list (->emacs (key %)) (->emacs (val %))) m))

  clojure.lang.Sequential
  (->emacs [coll]
    (map ->emacs coll))

  nil
  (->emacs [_]
    nil))

(comment
  (->emacs {:foo "bar"})
  ;; in elsip
  )

(defn candidates
  []
  (->emacs (take 50 (for [ns (all-ns)
                  [_k var] (ns-publics ns)
                  :let [m (meta var)]]
              {:ns (name (ns-name (:ns m)))
               :symbol (name (:name m))
               :file (:file m)
               :line (:line m)
               :doc (if (:doc m)
                      (first (line-seq (io/reader (.toCharArray (:doc m)))))
                      "")
               }
              ;; (format "%s/%s" (name (ns-name (:ns m))) (name (:name m)))
              ))
           ))
