#lang racket
; -------------------------------------
;              Helpers
; -------------------------------------
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (square x)
  (* x x))

; -------------------------------------
;           Exercise 2.33
; -------------------------------------
(displayln "*** Exercise 2.33 ***")

(define (map p sequence)
  (accumulate 
   (lambda (x y) (cons (p x) y))
   null
   sequence))

(map square (list 1 2 3 4 5))
; '(1 4 9 16 25)

(define (append seq1 seq2)
  (accumulate cons seq1 seq2))

(append (list 1 2 3) (list 4 5 6))
'(4 5 6 1 2 3)

(define (length sequence)
  (accumulate (λ (x y)(+ 1 y)) 0 sequence))

(length (list 1 4 19 100 3425 100 300))
; 7

; -------------------------------------
;           Exercise 2.34
; -------------------------------------
(displayln "*** Exercise 2.33 ***")