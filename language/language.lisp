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

(defun find-next-coma (tokens)
	(let
		(
			(token (car tokens))
			(rest (cdr tokens))
		)
		(cond
			((eq token '&) (list Nil rest))
			((null rest) (list (list token) Nil))
			(T
				(let
					((ans (find-next-coma rest)))
					(list (cons token (car ans)) (cadr ans))
				)
			)
		)
	)	
)

(defmacro : (x &rest tokens)
	`(let 
		(
			(val ,x)
			(equation (find-next-coma ',tokens))
		)
		(let
			(
				(func (car equation))
				(rest (cadr equation))
			)
			(cond
				((null (car func)) val)
				(T
					(setq val (eval-dash val func))
					(eval `(: ',val ,@rest))
				)
			)
		)
	)
)






