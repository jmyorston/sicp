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