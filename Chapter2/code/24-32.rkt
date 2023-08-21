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
; ((3 4) (1 2))

(define (deep-reverse lst)
  (let ((x (cond ((null? lst) null) 
                 ((pair? (car lst))
                  (append (deep-reverse (cdr lst))
                          (list (deep-reverse (car lst)))))
                 (else
                  (append (deep-reverse (cdr lst))
                          (list (car lst)))))))
    (reverse x)))

(deep-reverse x1)
; ((4 3) (2 1))

; -------------------------------------
;           Exercise 2.28
; -------------------------------------
(displayln "*** Exercise 2.28 ***")

(define (leaf? item)
  (not (pair? item)))

(define (fringe x)
  (cond ((null? x) null)
        ((leaf? x)(list x))
        (else (append (fringe (car x))(fringe (cdr x))))))
 
(define lst (list (list 1 2) (list 3 4)))
(fringe lst)
; (1 2 3 4)
(fringe (list lst lst))
; (1 2 3 4 1 2 3 4)
(define complex-list
  '((1 2) (3) () (4 (5) 6) 7 (8)))
(fringe complex-list)

; -------------------------------------
;           Exercise 2.29
; -------------------------------------
(displayln "*** Exercise 2.29 ***")

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))
 
(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))
 
(define (total-weight mobile)
  (cond ((not (pair? mobile)) 0) 
        ((not (pair? (branch-structure mobile))) (branch-structure mobile)) 
        (else (+ (total-weight (left-branch mobile))
                 (total-weight (right-branch mobile))))))

(define (torque b mobile)
  (* (total-weight (b mobile))(branch-length (b mobile))))

(define (balanced? mobile)
  (let ((l-torque (torque left-branch mobile))
        (r-torque (torque right-branch mobile)))
    (and (= l-torque r-torque)
         (if (not (number? (branch-structure (left-branch mobile))))
             (balanced? (branch-structure (left-branch mobile)))
             #t)
         (if (not (number? (branch-structure (right-branch mobile))))
             (balanced? (branch-structure (right-branch mobile)))
             #t))))

(define left-branch-1 (make-branch 2 5))
(define right-branch-1 (make-branch 5 2))
(define balanced-mobile (make-mobile left-branch-1 right-branch-1))
(balanced? balanced-mobile)
; #t
(define left-branch-2 (make-branch 2 5))
(define right-branch-2 (make-branch 4 2))
(define unbalanced-mobile (make-mobile left-branch-2 right-branch-2))
(balanced? unbalanced-mobile)
; #f

; -------------------------------------
;           Exercise 2.30
; -------------------------------------
(displayln "*** Exercise 2.30 ***")

(define (sq x)(* x x))

(define (square-tree t)
  (cond ((null? t) null)
        ((pair? t)
         (cons (square-tree (car t))(square-tree (cdr t))))
        (else (sq t))))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

; -------------------------------------
;           Exercise 2.31
; -------------------------------------
(displayln "*** Exercise 2.31 ***")

(define (square-tree-map tree)
  (tree-map sq tree))

(define (tree-map f t)
  (cond ((null? t) '())
        ((pair? t)(cons (tree-map f (car t))
                        (tree-map f (cdr t))))
        (else (f t))))
                   

(square-tree-map  (list 1
                        (list 2 (list 3 4) 5)
                        (list 6 7)))

; -------------------------------------
;           Exercise 2.32
; -------------------------------------
(displayln "*** Exercise 2.32 ***")

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map
                      (λ (sub)(cons (car s) sub))
                      rest)))))

(subsets '(1 2 3))