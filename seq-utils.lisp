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
	 




  