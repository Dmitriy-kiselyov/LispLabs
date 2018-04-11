;;;; В заданном списке списков найти самый длинный подсписок.
;;;; Использовать отображающие и применяющие функционалы.

(defun max-len (arr)
	(apply 'max (mapcar 'length arr))
)

(defun filter-len (arr len)
	(mapcan 
		(lambda (arr)
			(if (= len (length arr))
				(list arr)
				Nil
			)
		)
		arr
	)
)

(defun max-sublist-len (arr)
	(filter-len arr (max-len arr))
)

(setq arr (list (list 1 2 3) (list 1 2) (list 4 5 6)))

(print (max-sublist-len arr)) ; ((1 2 3) (4 5 6))