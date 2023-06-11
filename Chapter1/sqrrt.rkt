#lang racket
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))
; Recursive function that iteratively improves the guess
; until it reaches a "good enough" approximation of the
; square root of 'x'.

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
; Checks if the guess is "good enough" by comparing
; the absolute difference between the square of the guess
; and 'x' with a threshold value of 0.001.

(define (improve guess x)
  (average guess (/ x guess)))
; Improves the current guess by taking the average of
; the guess and the division of 'x' by the guess.

(define (average x y)
  (/ (+ x y) 2))
; Calculates the average of two numbers 'x' and 'y'.
; This is then used in the helper function 'improve'

(define (sqrt x)
  (sqrt-iter 1.0 x))
; Initializes the first guess as 1.0 and calls the
; sqrt-iter function to start the iterative process
; of improving the guess.

(define (square x)
  (* x x))
; Calculates the square of a number 'x'.

(sqrt 12)
; Calculates the square root of 9 using the sqrt function.
