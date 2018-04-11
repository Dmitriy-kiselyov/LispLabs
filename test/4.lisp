;;;; Заданный числовой список разбить на подсписки из возрастающих подпоследовательностей максимальной длины рядом стоящих чисел.

(defun increasing-seq (arr)
	(if (null (cdr arr))
		(list arr)
		(let
			(
				(cur (car arr))
				(ans (increasing-seq (cdr arr)))
			)
			(if (< cur (caar ans))
				(cons (cons cur (car ans)) (cdr ans))
				(cons (list cur) ans)
			)
		)
	)
)


(setq arr (list 2 7 10 8 3 4 9 1 2 0 8 3 2 5))

(print (increasing-seq arr)) ;; [[2, 7, 10], [8], [3, 4, 9], [1, 2], [0, 8], [3], [2, 5]]