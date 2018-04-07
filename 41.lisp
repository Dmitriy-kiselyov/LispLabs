;;;; 41) Generate tree by number of verticies

(defun generate-tree (n)
	(if (= n 0)
		Nil
		(list
			(generate-tree (ceiling (/ (- n 1) 2)))
			(list n)
			(generate-tree (floor (/ (- n 1) 2)))
		)
	)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(output 'generate-tree 0) ; Nil
(output 'generate-tree 1) ; (NIL (1) NIL)
(output 'generate-tree 2) ; ((NIL (1) NIL) (2) NIL)
(output 'generate-tree 3) ; ((NIL (1) NIL) (3) (NIL (1) NIL))
(output 'generate-tree 4) ; (((NIL (1) NIL) (2) NIL) (4) (NIL (1) NIL))
(output 'generate-tree 5) ; (((NIL (1) NIL) (2) NIL) (5) ((NIL (1) NIL) (2) NIL))
(output 'generate-tree 10) ; ((((NIL (1) NIL) (2) NIL) (5) ((NIL (1) NIL) (2) NIL)) (10) (((NIL (1) NIL) (2) NIL) (4) (NIL (1) NIL)))
