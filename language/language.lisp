(defun has-dash (equation)
	(let
		((args (cdr equation)))
		(some
			(lambda (x)
				(or (eq x '_) (and (listp x) (has-dash x)))
			)
			args
		)
	)
)

(defun append-dash (_ equation)
	(let
		(
			(action (car equation))
			(args (cdr equation))
		)
		`(,action ',_ ,@args)
	)
)

(defun replace-dash (_ equation)
	`(let 
		((_ ',_))
		,equation
	)
)

(defun eval-dash (_ equation)
	(if (has-dash equation)
		(eval (replace-dash _ equation))
		(eval (append-dash _ equation))
	)
)

(defmacro : (x &rest funcs)
	`(let 
		((val ,x))
		(mapcar
			(lambda (func)
				(setq val (eval-dash val func))
			)
			(quote ,funcs)
		)
		val
	)
)
