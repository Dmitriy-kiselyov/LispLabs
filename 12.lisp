;;;; 10) Replace 2 sequent equal elements with one

(defun replace-sequent (arr)
	(
		(lambda (head second arr)
			(cond
				((null arr) Nil)
				((null (cdr arr)) (list head))
				((eq head second) (cons head (replace-sequent (cddr arr))))
				(T (cons head (replace-sequent (cdr arr))))
			)
		) (car arr) (cadr arr) arr
	)			
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(output 'replace-sequent '(5 6 6 7 7 7 8 8 8 8 10)) ; (5 6 7 7 8 8 10)
(output 'replace-sequent '(1 2 3 2 1 1))			; (1 2 3 2 1)
(output 'replace-sequent '(1 2 3 Nil Nil Nil))		; (1 2 3 NIL NIL)
(output 'replace-sequent '(1 2 3))					; (1 2 3)
