;;;; 1) Define macros that returns self-call

(defmacro self-call (&whole w &rest x)
  `(quote ,w)
)

(print (self-call (+ 1 2) (+ 3 4 5))) ; (SELF-CALL (+ 1 2) (+ 3 4 5))