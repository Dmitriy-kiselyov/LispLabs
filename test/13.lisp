;;;; Бесконечная матрица содержит все натуральные числа в диагональном порядке
;;;; Построить эту матрицу и вычислить сумму первых 10 элементов 5-го столбца матрицы

(defun gen-seq-from (from len)
	(defun iterate (i last)
		(if (= i last)
			(list i)
			(cons i (iterate (+ i 1) last))
		)
	)
	(iterate from (1- (+ from len)))
)

(defun gen-val (n val)
	(if (= n 1) 
		(list val)
		(cons val (gen-val (- n 1) val))
	)
)
	

(defun prepend (v arr)
	(cond
		((and (null v) (listp arr)) arr)
		((null v) (list arr))
		((listp arr) (cons v arr))
		(T (list v arr))
	)
)

(defun generate (n)
	(defun iterate2 (start level)
		(if (= level n)
			(gen-seq-from start n)
			(mapcar 'prepend
				(append (gen-seq-from start level) (gen-val (- n level) Nil))
				(iterate2 (+ start level) (1+ level))
			)
		)
	)
	(iterate2 1 1)
)	

(setq matx (generate 20))
(print matx)

(defun sum-col (matx col n)
	(defun list-get (arr i)
		(cond
			((null arr) 0)
			((= i 0) (car arr))
			(T (list-get (cdr arr) (1- i)))
		)
	)

	(apply '+
		(mapcar (lambda (arr) (list-get arr col))
			(subseq matx 0 n)
		)
	)
)

(print (sum-col matx 4 10))


















