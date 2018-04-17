;;;; 31) Get first element from both lists

(defun first-not-null (arr fun)
	(cond
		((null arr) Nil)
		(T
			(let
				((ans (funcall fun (car arr))))
				(if (null ans)
					(first-not-null (cdr arr) fun)
					ans
				)
			)
		)
	)
)

(defun first-match (arr1 arr2)
	(first-not-null arr1
		(lambda (x)
			(first-not-null arr2
				(lambda (y)
					(if (= x y)
						x
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



(output 'first-match '(5 6 7 8) '(9 7 3)) 	; 7
(output 'first-match '(6 7 8) '(3 4 5)) 	; Nil
(output 'first-match '(1 2 3) '(7)) 		; Nil
(output 'first-match '(1 2) '(5 5 5 5 5 2)) ; 2
