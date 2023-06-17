#lang racket
(define (ackerman x y)
  (cond
    [(= y 0) 0]
    [(= x 0) (* 2 y)]
    [(= y 1) 2]
    [else
     (ackerman (- x 1)
               (ackerman x (- y 1)))]))

(ackerman 1 10)
; 1024
(newline)
(ackerman 2 4)
; 65536
(newline)
(ackerman 3 3)
; 65536

(define (f n)
  (ackerman 0 n))
(define (g n)
  (ackerman 1 n))
(define (h n)
  (ackerman 2 n))
(define (k n)
  (* 5 n n))
