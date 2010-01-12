(in-package :cl-utils)

(defun blocks (seq &key test)
  "Return list of blocks of equal (according to test) elements in sequence.  Each block is described by a pair (ELT . NUM-OCCURRENCES)."
  (orf test #'equal)
  (nreverse
   (let ((blocks nil)
	 (current-pair nil))
     (map nil
	  #'(lambda (x)
	      (if (and current-pair (funcall test x (car current-pair)))
		  (incf (cdr current-pair))
		  (progn 
		    (setq current-pair (cons x 1))
		    (push current-pair blocks))))
	  seq)
     blocks)))
	 




  
(defun is-prefix (s1 s2 &key test)
  (orf test #'eql)
  (setq s1 (coerce s1 'list)
	s2 (coerce s2 'list))
  (or (null s1)
      (and (not (null s2))
	   (dsbind (f . r) s1
	     (dsbind (f2 . r2) s2
	       (and (funcall test f f2)
		    (is-prefix r r2)))))))