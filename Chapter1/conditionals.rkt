#lang racket
; sample conditional
(define (abs x)
  (cond
    [(> x 0) x]
    [(= x 0) 0]
    [(< x 0) (- x)]))
(display (abs 3))
(newline)
(display (abs 0))
(newline)
(display (abs -1))

; conditional refactored to show another way
(newline)
(define (abs1 x)
  (cond
    [(< x 0) (- x)]
    [else x]))

(display (abs1 3))
(newline)
(display (abs1 0))
(newline)
(display (abs1 -1))

; using if is much more efficient
(newline)
(define (abs2 x)
  (if (< x 0) (- x) x))
(display (abs2 3))
(newline)
(display (abs2 0))
(newline)
(display (abs2 -1))


