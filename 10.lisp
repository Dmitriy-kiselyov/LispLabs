;;;; 10) Remove last N elements from array

(defun slice-end (arr n)
	(defun leave-first (arr n)
		(if (= n 0)
			Nil
			(cons (car arr) (leave-first (cdr arr) (- n 1)))
		)
	)
	
	(let
		((size (- (list-length arr) n)))
		(if (> size 0)
			(leave-first arr size)
			Nil
		)
	)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" (values args) (apply func args))
)

(output 'slice-end '(1 5 9 5 1) 2) ; (1 5 9)
(output 'slice-end '(5 4 3 2) 0)   ; (5 4 3 2)
(output 'slice-end '(1 2 3 4) 5)   ; Nil