(defmacro : (x &rest funcs)
	`(let 
		((_ ,x))
		(mapcar
			(lambda (func)
				(let
					(
						(action (car func))
						(args (cdr func))
					)
					(setq _ (apply action (cons _ args)))
				)
			)
			(quote ,funcs)
		)
		_
	)
)

(print
	(
		: 10
		(+ 1 2)
		(- 4)
	)
)

(print
	(
		: (list 1 2 3 4 5)
		(cdr)
		(cdr)
		(car)
	)
)