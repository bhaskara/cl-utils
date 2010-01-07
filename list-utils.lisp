(in-package :cl-utils)

(defun lookup-alist (k l &rest args)
  "Get value corresponding to K in L.  Signal error if K not present.  Remaining args passed on to assoc."
  (cdr (check-not-null (apply #'assoc k l args))))

(defun filter (pred l)
  "Return list of elements in L that satisfy PRED"
  (loop for x in l
     when (funcall pred x) collect x))

(defun remove-nth (n l)
  (nconc (subseq l 0 n) (nthcdr (1+ n) l)))

(defun is-permutation (l1 l2 &key test)
  (orf test #'eql)
  (if l1
      (dsbind (f . r) l1
	(awhen (position f l2 :test test)
	  (is-permutation r (remove-nth it l2) :test test)))
      (null l2)))

