;;;; 3) Define (APL-APPLY f x) wich applies every function (f1 f2 ...) to corresponding argument and returns list

(defun apl-apply (funcs arr)
	(mapcar 'funcall funcs arr)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(defun add-1 (num)
	(+ num 1)
)

(defun add-5 (num)
	(+ num 5)
)

(defun double (num)
	(* 2 num)
)

(defun square (num)
	(* num num)
)

(output 'apl-apply '(add-1 add-5 double square) '(1 5 3 10)) ; (2 10 6 100)
