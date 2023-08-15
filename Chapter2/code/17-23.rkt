#lang racket
; -------------------------------------
;            book helpers
; -------------------------------------
; returns the length of a list
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

; appends two lists
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

; extracts n-1 
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

; -------------------------------------
;            Exercise 2.17
; -------------------------------------
; extracts the last item of a list
(define (last-pair l)
  (if (null? (cdr l))
      l
      (last-pair (cdr l))))

(last-pair (list 23 72 149 34))
; '(34)

; -------------------------------------
;           Exercise 2.18
; -------------------------------------
; reverses a list
(define (reverse l)
  (if (null? l)
      l
      (append (reverse (cdr l)) (list (car l)))))

(define l1 (list 1 4 9 16 25))
(reverse l1)
; '(25 16 9 4 1)

; -------------------------------------
;           Exercise 2.19
; -------------------------------------
(define uk (list 200 100 50 20 10 5 2 1))
(define us (list 50 25 10 5 1))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))


(define (first-denomination d)
  (car d))

(define (except-first-denomination d)
  (cdr d))

(define (no-more? d)
  (null? d))

; test it with currencies:
(cc 155 uk)
; 24980
(cc 46 us)
; 39

; compare the execution times:
(time (cc 155 uk))
; cpu time: 116 real time: 121 gc time: 3
(time (cc 155 (reverse uk)))
; cpu time: 504 real time: 520 gc time: 56

; -------------------------------------
;           Exercise 2.20
; -------------------------------------
(define (same-parity x . y)
  (cons x 
        (filter (if (even? x) 
                    even?
                    odd?)
                y)))


(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)

; '(1 3 5 7)
; '(2 4 6)

; -------------------------------------
;            Exercise 2.21             
; -------------------------------------
; sq helper
(define (sq x)
  (* x x))

(define (square-list items)
  (if (null? items)
      '()
      (cons (sq (car items))
            (square-list (cdr items)))))

(square-list '(1 2 3 4))

; '(1 4 9 16)

(define (square-list-map items)
  (map sq items))

(square-list-map '(1 2 3 4))

; '(1 4 9 16)

; -------------------------------------
;            Exercise 2.22             
; -------------------------------------
(define (square-list-louis items)
  (define (iter things answer)
    (displayln things)
    (displayln answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (sq (car things))
                    answer))))
  (iter items '()))

(square-list-louis '(1 2 3 4))


(define (square-list-louis-two items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (sq (car things))))))
  (iter items '()))

(square-list-louis-two '(1 2 3 4))

; -------------------------------------
;            Exercise 2.23             
; -------------------------------------

(define (for-each f x)
  (if (null? x)
      #t
      (
       (λ ()
        (f (car x))
        (for-each f (cdr x)))
       )))

(for-each 
 (lambda (x) (newline) (display x))
 (list 57 321 88))
