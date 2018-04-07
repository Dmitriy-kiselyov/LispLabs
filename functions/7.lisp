;;;; 7) Define (REMOVE-IF-NOT pred x) wich removes all elements from the list matching False for predicate

(defun my-remove-if-not (func arr)
	(mapcan (lambda (x res) (and res (list x)))
		arr (mapcar func arr))
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(output 'my-remove-if-not 'evenp '(1 2 3 4 5 6)) ; (2 4 6)
