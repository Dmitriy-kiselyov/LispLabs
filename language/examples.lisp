(require "./language.lisp")

(
	: 10
	(+ _ 1 2)	;13
	(- 4 _)		;-9
	(* -1)		;9
	(- 4)		;5
	(* _ _)		;25
	(print)
)

(
	: (list 1 2 3 4 5)
	(cdr _)					;(2 3 4 5)
	(cdr)					;(3 4 5)
	(append (list 6 7 8) _)	;(6 7 8 1 2 3)
	(print)
)

(
	: 2
	(print (list 1 _ 3))
)