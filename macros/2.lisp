;;;; 2) Define macros (POP stack)

(defmacro my-pop (stack)
	`(let ((first Nil))
		(setq first (car ,stack))
		(setq ,stack (cdr ,stack))
		first
	)
)

(setq st `(7 8 9 10))
(print (my-pop st)) ; 7
(print (my-pop st)) ; 8
(print (my-pop st)) ; 9
(print (my-pop st)) ; 10
