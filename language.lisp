(defun has-dash (equation)
	(let
		((args (cdr equation)))
		(some
			(lambda (x) (eq x '_))
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

;EXAMPLES

(print
	(
		: 10
		(+ _ 1 2)	;13
		(- 4 _)		;-9
		(* -1)		;9
		(- 4)		;5
		(* _ _)		;25
	)
)

(print
	(
		: (list 1 2 3 4 5)
		(cdr _)					;(2 3 4 5)
		(cdr)					;(3 4 5)
		(append (list 6 7 8) _)	;(6 7 8 1 2 3)
	)
)

