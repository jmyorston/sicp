#lang racket

(define (gcd a b)
  (cond
    [(= a b) a]
    [(> a b) (gcd (- a b) b)]
    [else (gcd a (- b a))]))

(displayln (gcd 206 40))
(displayln (gcd 33 77))
