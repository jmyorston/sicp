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

(define (enumerate-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

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
(displayln "*** Exercise 2.34 ***")

(define (horner-eval x coefficient-sequence)
  (accumulate (λ (this-coeff higher-terms)(+ (* x higher-terms) this-coeff))
              0
              coefficient-sequence))

(horner-eval 2 (list 1 3 0 5 0 1))

; -------------------------------------
;           Exercise 2.35
; -------------------------------------
(displayln "*** Exercise 2.35 ***")

(define (count-leaves t)
  (accumulate +
              0
              (map
               (λ (x) (if (pair? x) 0 1))
               (enumerate-tree t))))

(count-leaves (list 1 2 (list 3 4 5) 4 5 (list 1 (list 3))))


; -------------------------------------
;           Exercise 2.36
; -------------------------------------
(displayln "*** Exercise 2.36 ***")

(define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(accumulate-n + 0 s)

; '(22 26 30)

; -------------------------------------
;           Exercise 2.37
; -------------------------------------
(displayln "*** Exercise 2.37 ***")


(define (dot-product v w)
  (accumulate + 0 (map * 'v w)))

(define (matrix-*-vector m v)
  (map (λ (r)(dot-product v r)) m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (λ (x) (map (λ (y) (dot-product x y)) cols)) m)))






