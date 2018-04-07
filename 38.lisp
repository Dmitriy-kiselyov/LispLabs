;;;; 38) Unite two sets

(defun has (arr val)
	(cond
		((null arr) Nil)
		((= (car arr) val) T)
		(T (has (cdr arr) val))
	)
)

(defun reduce-list (arr accum fun)
	(if (null arr)
		accum
		(reduce-list (cdr arr) (funcall fun (car arr) accum) fun)
	)
)

(defun unite (arr1 arr2)
	(reduce-list arr2 arr1
		(lambda (val accum)
			(if (has accum val)
				accum
				(cons val accum)
			)
		)
	)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(output 'unite '(1 2 5) '(6 2 1 7)) ; (7 6 1 2 5)
(output 'unite '(1 2 3) '(4 5 6))	; (6 5 4 1 2 3)
(output 'unite '(1 2 3) '(3 2))		; (1 2 3)
(output 'unite Nil Nil) 			; Nil





