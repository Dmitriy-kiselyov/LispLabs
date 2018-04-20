;;;; 4) Define LISP form (FIF test negative zero positive) as macros

(defmacro fif (test negative zero positive)
	`(cond
		((< ,test 0) ,negative)
		((= ,test 0) ,zero)
		(T ,positive)
	)
)

(print (fif -1 '- '0 '+)) ; -
(print (fif 0 '- '0 '+))  ; 0
(print (fif 1 '- '0 '+))  ; +
