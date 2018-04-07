;;;; 47) Remove all symbol properties

(setq *print-case* :downcase)

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

(defun clear-props (sym)
	(iterate-list (get-props-names sym)
		(lambda (prop)
			(remprop sym prop)
		)
	)
)

(defun clear-props-and-show (sym)
	(clear-props sym)
	(symbol-plist sym)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(setf (get 'Sym 'a) 5)
(setf (get 'Sym 'b) "Hello!")
(setf (get 'Sym 'c) 'Another-symbol)
(setf (get 'Sym 'd) Nil)

(output 'clear-props-and-show 'Sym) ; Nil
