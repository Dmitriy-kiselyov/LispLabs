;;;; 44) Check if tree is subtree

(defun is-subtree (tree sub-tree)
	(cond
		((null tree) Nil)
		((equal tree sub-tree) T)
		(T 	(or
				(is-subtree (car tree) sub-tree)
				(is-subtree (caddr tree) sub-tree)
			)
		)
	)
)

(defun output (func &rest args)
	(format t "With args ~a received ~a~%" args (apply func args))
)

(setq *tree* 
	(list
		(list
			Nil
			5
			(list Nil 7 Nil)
		)
		2
		(list
			(list Nil 3 Nil)
			6
			(list Nil 1 Nil)
		)
	)
)

(setq *sub-tree* 
	(list
		(list Nil 3 Nil)
		6
		(list Nil 1 Nil)
	)
)

(setq *sub-tree-small* (list Nil 7 Nil))

(setq *not-sub-tree* 
	(list
		Nil
		5
		(list Nil 77 Nil)
	)
)

(output 'is-subtree *tree* *sub-tree*)		 ; T
(output 'is-subtree *tree* *sub-tree-small*) ; T
(output 'is-subtree *tree* *not-sub-tree*)	 ; Nil
(output 'is-subtree *sub-tree-small* *tree*) ; Nil
