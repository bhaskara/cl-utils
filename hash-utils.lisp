(in-package :cl-utils)

(defun hash-table-has-key (h k)
  "Return true iff key exists in table (even if it has value nil)"
  (nth-value 1 (gethash k h)))

(defmacro do-hash-entries (((k v) h &optional ret-val) &body body)
  "Iterate with K and V looping through corresponding keys and values of hash table H, and repeatedly execute body.  Both K and V are considered ignorable within BODY.  Uses maphash, so the only changes allowed on an iteration are that current hash value of K may be changed and entry for K may be removed."
  `(progn (maphash #'(lambda (,k ,v) (declare (ignorable ,k ,v)) ,@body) ,h)
	  ,ret-val))

(defun hash-keys (h)
  "Return list of keys of H"
  (let ((l nil))
    (do-hash-entries ((k v) h l)
      (push k l))))

(defun pprint-hash-table (&rest args)
  (bind-pprint-args (str h) args
    (pprint-logical-block (str (hash-keys h) :prefix "[" :suffix "]")
      (loop
	 (pprint-exit-if-list-exhausted)
	 (let ((k (pprint-pop)))
	   (format str "~a : ~a" k (gethash k h))
	   (pprint-exit-if-list-exhausted)
	   (pprint-newline :mandatory str))))))


(defun hash-table-to-alist (h)
  (let ((l nil))
    (do-hash-entries ((k v) h l)
      (push (cons k v) l))))