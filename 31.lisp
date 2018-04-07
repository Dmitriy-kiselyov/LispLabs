;;;; 31) Get first element from both lists

(defun iterate-list (arr fun)
	(cond
		((null arr) Nil)
		(T
			(funcall fun (car arr))
			(iterate-list (cdr arr) fun)
		)
	)
)

(defun first-match (arr1 arr2)
	(iterate-list arr1
		(lambda (x)
			(iterate-list arr2
				(lambda (y)
					(if (= x y)
						(return-from first-match x)
						Nil
					)
				)
			)
		)
	)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)



(output 'first-match '(5 6 7 8) '(9 3 7)) 	; 7
(output 'first-match '(6 7 8) '(3 4 5)) 	; Nil
(output 'first-match '(1 2 3) '(7)) 		; Nil
(output 'first-match '(1 2) '(5 5 5 5 5 2)) ; 2
