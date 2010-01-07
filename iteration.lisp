(in-package :cl-utils)

(defmacro do-iterator ((vars i &optional ret-val) &body body)
  "I must be a function of zero arguments, where the first return value is nil iff the iteration is complete and the remaining values are the actual elements in this round of the iteration.  So long as the iteration is not done, VARS are bound to those values and the BODY is repeatedly evaluated."
  (if (symbolp vars) (setq vars (list vars)))
  (with-gensyms (not-done iter)
    `(let ((,iter ,i))
       (loop
	  (mvbind ,(cons not-done vars) (funcall ,iter)
	    (if ,not-done
		(progn ,@body)
		(return ,ret-val)))))))



