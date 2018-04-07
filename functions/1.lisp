;;;; 1) Define FUNCALL throught APPLY

(defun show-args (x y z)
	(format t "~a ~a ~a~%" x y z)
)

(defun my-funcall (func &rest args)
	(apply func args)
)

(my-funcall 'show-args 1 2 3) ; 1 2 3