(in-package :cl-utils)

(defvar *tol* 1e-6 "Default tolerance for floating point ops")

(defun close-to (x y &optional (tol *tol*))
  "Are X and Y within absolute distance TOL of each other?"
  (declare (real x y))
  (< (abs (- x y)) tol))

(defun std (v)
  "Return standard deviation (and mean) of numbers in V"
  (let ((m (mean v)))
    (values (sqrt (/ (reduce #'+ v :key #'(lambda (x) (expt (- x m) 2))) (length v))) m)))
  
(defun mean (v)
  (/ (reduce #'+ v) (length v)))

(defun quantile (&rest args)
  (condlet (((rest args) (q (first args)) (v (second args)))
	    (t (q .5) (v (first args))))
    (let ((k (floor (* (length v) q))))
      (elt (sort (copy-seq v) #'<) k))))
  