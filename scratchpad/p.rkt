#lang racket
(define (cube x)
  (* x x x))
(define (p x)
  (displayln "p")
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(displayln (sine 12.15))
(displayln (p 4.05))
