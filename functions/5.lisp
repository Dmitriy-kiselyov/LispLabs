;;;; 5) Define (SOME pred x) wich is True if it is True for at least one element

(defun has-true (arr)
	(if (null arr)
		Nil
		(or (car arr) (has-true (cdr arr)))
	)
)

(defun my-some (func arr)
	(has-true (mapcar func arr))
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(output 'my-some 'evenp '(1 3 5 7)) ; Nil
(output 'my-some 'evenp '(1 3 6 7)) ; T
