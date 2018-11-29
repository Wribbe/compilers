(define (print n)
  (display n) (newline))

(print (+ 137 349))
(print (- 1000 334))
(print (* 5 99))
(print (/ 10 5))
(print (+ 2.7 10))

(print (+ 21 35 12 7))
(print (* 25 4 12))
(print (+ (* 3 5) (- 10 6)))
(print (+ (* 3 (+ (* 2 4 ) (+ 3 5))) (+ (- 10 7) 6)))

; Pretty-printing.

(print
  (+ (* 3
        (+ (* 2 4 )
           (+ 3 5)))
     (+ (- 10 7)
        6)))

; Naming and the Environment.

(define size 2)
(print size)
(print (* 5 size))

(define pi 3.14159)
(define radius 10)
(print (* pi (* radius radius)))
(define circumference (* 2 pi radius))
(print circumference)

; define -> simplest means of abstraction.
; keeps track of definitions in global environment.

(print (* (+ 2 (* 4 6 ))
          (+ 3 5 7))
       )

; Recursive.
; ----------
;   1.) Evaluate the subexpression of the combination.
;   2.) Apply the value of leftmost sub-expression (operator) to the other
;       values of the other sub-expressions (the operands).
