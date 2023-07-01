#lang racket
; fibonacci
; if n = 0; 0, if n = 1; 1, else (n-1)+(n-2)

; tree recursion
(define (fib n)
  (cond
    [(= n 0) 0]
    [(= n 1) 1]
    [else (+ (fib (- n 1)) (fib (- n 2)))]))

(display (fib 1))
(newline)
(display (fib 2))
(newline)
(display (fib 3))
(newline)
(display (fib 4))
(newline)
(display (fib 5))
(newline)
(display (fib 6))
(newline)
(display (fib 7))

; linear fibonnacci method
(define (linfib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(display (linfib 1))
(newline)
(display (linfib 2))
(newline)
(display (linfib 3))
(newline)
(display (linfib 4))
(newline)
(display (linfib 5))
(newline)
(display (linfib 6))
(newline)
(display (linfib 7))
