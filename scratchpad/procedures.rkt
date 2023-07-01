#lang racket
(define (square x)
  (* x x))

(newline)
(display (square 2))

(newline)
(define (sumofsquares x y)
  (+ (square x) (square y)))

(display (sumofsquares 3 4))

(newline)
(define (f a)
  (sumofsquares (+ a 1) (* a 2)))
(display (f 5))