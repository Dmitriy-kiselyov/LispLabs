;;;; 48) Check if symbol has property

(defun get-props-names (sym)
	(defun iterate (props)
		(if (null props)
			Nil
			(cons (car props) (iterate (cddr props)))
		)
	)
	(iterate (symbol-plist sym))
)

(defun iterate-list (arr fun)
	(cond
		((null arr) Nil)
		(T
			(funcall fun (car arr))
			(iterate-list (cdr arr) fun)
		)
	)
)

(defun has-prop (sym prop)
	(iterate-list (get-props-names sym)
		(lambda (prop-name)
			(if (eq prop-name prop)
				(return-from has-prop T)
				Nil
			)
		)
	)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(setf (get 'Sym 'a) 5)
(setf (get 'Sym 'b) "Hello!")
(setf (get 'Sym 'c) 'Another-symbol)
(setf (get 'Sym 'd) Nil)

(output 'has-prop 'Sym 'a) ; T
(output 'has-prop 'Sym 'f) ; Nil
(output 'has-prop 'Sym 'd) ; T
