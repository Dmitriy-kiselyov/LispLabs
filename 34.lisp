;;;; 34) Check if two sets are equal

(defun has (arr val)
	(cond
		((null arr) Nil)
		((= (car arr) val) T)
		(T (has (cdr arr) val))
	)
)

(defun remove-el (arr val)
	(cond
		((null arr) Nil)
		((= (car arr) val) (cdr arr))
		(T (cons (car arr) (remove-el (cdr arr) val)))
	)
)	

(defun sets-equal (arr1 arr2)
	(cond
		((null arr1) (null arr2))
		((not (has arr2 (car arr1))) Nil)
		(T (sets-equal (cdr arr1) (remove-el arr2 (car arr1))))
	)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(output 'sets-equal '(1 2 3) '(3 2 1)) 		 ; T
(output 'sets-equal '(5 2 5 4) '(2 4 5 5)) 	 ; T
(output 'sets-equal '(1 2 3 4 5 6) '(1 2 3)) ; Nil
(output 'sets-equal '(1 2 3) '(1 2 4)) 		 ; Nil
(output 'sets-equal '(5 2 1 1) '(5 2 1)) 	 ; Nil
