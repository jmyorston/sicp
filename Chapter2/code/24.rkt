#lang racket

; -------------------------------------
;           Exercise 2.24
; -------------------------------------
(displayln "*** Exercise 2.24 ***")

(define l1 '(1 3 (5 7) 9))

(define l2 '((7)))

(define l3 '(1 (2 (3 (4 (5 (6 7)))))))

; l1
(car (cdr (car (cdr (cdr l1)))))
; 7

; l2 
(car (car l2))
; 7

; l3 
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr l3))))))))))))
; 7


; -------------------------------------
;           Exercise 2.25
; -------------------------------------
(displayln "*** Exercise 2.25 ***")

(define x (list 1 2 3))
 
(define y (list 4 5 6))

(append x y)

(cons x y)

(list x y)

; -------------------------------------
;           Exercise 2.26
; -------------------------------------
(displayln "*** Exercise 2.26 ***")

(append x y)
 ; '(1 2 3 4 5 6)

(cons x y)
 ; '((1 2 3) 4 5 6)

(list x y)
 ; '((1 2 3)(4 5 6))

; -------------------------------------
;           Exercise 2.27
; -------------------------------------
(displayln "*** Exercise 2.27 ***")


(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)))))


(define x1 (list (list 1 2) (list 3 4)))
(reverse x1)

(define (deep-reverse l)
  (for-each reverse l))

(deep-reverse x)
;((4 3) (2 1))