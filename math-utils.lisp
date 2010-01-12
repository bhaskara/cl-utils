(in-package :cl-utils)

(defvar *tol* 1e-6 "Default tolerance for floating point ops")

(defun close-to (x y &optional (tol *tol*))
  "Are X and Y within absolute distance TOL of each other?"
  (declare (real x y))
  (< (abs (- x y)) tol))