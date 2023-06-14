#lang racket
; factorial procedure
(define (factorial x)
  (fact-iter 1 1 x))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

(factorial 6)

; same factorial procedure defined as lexical
(define (factoriallex x)
  (define (fact-iter product counter)
    (if (> counter x)
        product
        (fact-iter (* counter product)
                   (+ counter 1))))
  (fact-iter 1 1))

(newline)
(factoriallex 6)
