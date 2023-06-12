#lang racket
(define accuracy 0.001)
(define input 8)

(define (newton-method guess x)
  (if (gooder-enough? guess x)
      guess
      (newton-method (improve guess x) x)))

(define (gooder-enough? guess x)
  (< (abs (- (- guess (improve guess x))))
     (* accuracy guess)))

(define (improve guess x)
  (nm guess x))

; nm is the newton method
(define (nm guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube-of x)
  (newton-method 1.0 x))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(displayln (cube-of input))
