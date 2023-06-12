#lang racket
(define accuracy 0.001)
(define input 0.00303033)

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt-iter2 guess x)
  (if (gooder-enough? guess x)
      guess
      (sqrt-iter2 (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) accuracy))

(define (gooder-enough? guess x)
  (< (abs (- (diff guess (improve guess x))))
     (* accuracy guess)))

(define (diff x y)
  (- x y))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt2 x)
  (sqrt-iter2 1.0 x))

(define (square x)
  (* x x))

(displayln
 "Square root approximation using good-enough?:")
(displayln (sqrt input))
(newline)
(displayln
 "Square root approximation using gooder-enough?:")
(displayln (sqrt2 input))
(newline)
(displayln "Actual value is:")
(displayln "0.05508677203176232")
