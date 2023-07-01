#lang racket
; function to define square root
(define (sqrt2 x)
  (define (good-enough? guess)
    (< (abs (- (pow guess 2) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

; avg helper
(define (average x y)
  (/ (+ x y) 2))

; function to define fibonacci sequence
(define (linfib n)
  (define (fib-iter a b count)
    (if (= count 0)
        b
        (fib-iter (+ a b)
                  a
                  (- count 1))))
  (fib-iter 1 0 n))

; define φ phi
(define phi (/ (+ 1 (sqrt 5)) 2))

; define ψ psi
(define psi (/ (- 1 (sqrt 5)) 2))

; define power
(define (pow x y)
  (if (= y 0) 1 (* x (pow x (- y 1)))))

; fib n using psi and phi
(define (fib n)
  (/ (- (pow phi n) (pow psi n))
     (sqrt 5)))

; check outputs
(displayln (fib 3)) ; outputs 2
(displayln (linfib 3)) ; outputs 2
(displayln (fib 5)) ; outputs 5
(displayln (linfib 5)) ; outputs 5
(displayln (fib 7)) ; outputs 13
(displayln (linfib 7)) ; outputs 13
