;;;; 3) Define LISP form (If condition p q) as macros

(defmacro my-if (condition p q)
	`(cond (,condition ,p) (T ,q))
)

(print (my-if (> 1 2) "A" "B")) ; B
(print (my-if (< 1 2) "A" "B")) ; A
