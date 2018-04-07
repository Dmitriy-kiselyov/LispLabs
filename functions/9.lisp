;;;; 9) Define generator for Fibonachi numbers

(defun fibonachi ()
	(let
		((prev 0) (cur 1) (ans 0) (next 0))
		(lambda () (and
			(setq ans prev)
			(setq next (+ prev cur))
			(setq prev cur)
			(setq cur next)
			ans
		))
	)
)

(setq gen (fibonachi))
(setq gen2 (fibonachi))

(print (funcall gen)) ; 0
(print (funcall gen)) ; 1
(print (funcall gen)) ; 1
(print (funcall gen)) ; 2
(print (funcall gen)) ; 3
(print (funcall gen)) ; 5
(print (funcall gen)) ; 8

(terpri)

(print (funcall gen2)) ; 0
(print (funcall gen2)) ; 1
(print (funcall gen2)) ; 1
(print (funcall gen2)) ; 2
(print (funcall gen2)) ; 3
(print (funcall gen2)) ; 5
(print (funcall gen2)) ; 8
