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

; special forms.
; --------------
;   Exceptions to the general evaluation rules, ex. (define x 3)
;   each has its own special evaluation rule.

; General form of a procedure definition is:
; (define (<name> <formal parameters>) <body>)

(define (square x) (* x x))
(print (square 21))
(print (square (+ 2 5)))
(print (square (square 3)))

(define (sum-of-squares x y)
  (+ (square x) (square y)))
(print (sum-of-squares 3 4))

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

(print (f 5))

; 1.1.5 The Substitution Model for Procedure Application
; ------------------------------------------------------
; Evaluate compound procedure -> interpreter evaluates the elements of the
; combination and applies the procedure to the arguments. (value of the
; operator of the combination to the value of the operands of the combination)
; Substitute one thing at the time -> substitution model.
; (Not really how the interpreter works, does not manipulate text!)

; Applicative order versus normal order
; -------------------------------------
; Normal-order-eval: Fully expand -> reduce.
; Applicative-order-eval: evaluate arguments -> apply.
; Lisp uses Applicative, ex. no need to redo calculation.

; 1.1.6 Conditional Expression and Predicates
; -------------------------------------------
; case analysis:

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(print (abs -10))

; predicate -> evaluate to True/False.

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(print (abs -10))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(print (abs -10))

; Special form of if with two outcomes.
; (if <predicate> <consequent> <alternative>)
; also logical composition operations {and,or,not} (and/or are special forms
; not procedures, all sub-expressions are not always evaluated)

; Exercise 1.1
; ------------
; 10 -> 10
; (+ 5 3 4) -> 12
; (- 9 1) -> 8
; (/ 6 2) -> 3
; (+ (* 2 4) (- 4 6)) -> 6
(define a 3) ;-> Value: a
(define b (+ a 1 )) ;-> Value b
; (+ a b (* a b)) -> 19
; (= a b) -> False
(if (and (> b a) (< b (* a b)))
  (print b)
  (print a)) ; -> 4
(cond ((= a 4) (print 6))
      ((= b 4) (print (+ 6 7 a)))
      (else 35)) ; -> 16
; ( + 2 (if (> b a) b a)) -> 6
(print (* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))) ; -> 16

; Exercise 1.2
; ------------
