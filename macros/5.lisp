;;;; 5) Define LISP form (REPEAT e UNTIL p) as macros

(defmacro repeat (e until p)
	`(if ,p
		NIL
		(progn ,e (repeat ,e until ,p))
	)
)

(setq i 0)
(repeat
	(progn
		(print i)
		(setq i (+ i 1))
	)
	until (= i 10)
)

; 0 1 2 3 4 5 6 7 8 9
