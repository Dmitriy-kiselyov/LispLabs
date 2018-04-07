;;;; 19) Create "onion" function

(defun onion (n)
	(defun iterate (i)
		(if (= i n)
			i
			(list (iterate (+ i 1)))
		)
	)
	
	(iterate 0)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(output 'onion 1) ; (1)
(output 'onion 3) ; (((3)))
(output 'onion 5) ; (((((5)))))
(output 'onion 0) ; 0