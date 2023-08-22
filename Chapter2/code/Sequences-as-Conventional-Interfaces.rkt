#lang racket
; helpers:
(define (square x)
  (* x x))

(define (fib n)
    (cond
      ((= n 0) 0)
      ((= n 1) 1)
      (else
        (+ (fib (- n 1))
           (fib (- n 2))))))


; takes a tree as argument and computes the sum of the squares of
; the leaves that are odd:
; - enumerates the leaves of a tree;
; - filters them, selecting the odd ones;
; - squares each of the selected ones; and
; - accumulates the results using +, starting with 0.
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))


; constructs a list of all the even Fibonacci numbers Fib(k), where k
; is less than or equal to a given integer n
; - enumerates the integers from 0 to n;
; - computes the Fibonacci number for each integer;
; - filters them, selecting the even ones; and
; - accumulates the results using cons, starting with the empty list.
(define (even-fibs n)
  (define (next k)
    (if (> k n)
        null
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

; Despite the fact that these two procedures are structurally very different,
; a more abstract description of the two computations reveals a great deal
; of similarity.
; they can be broken down into signals to simplify the control flow.

; filtering can be achived through the following procedure:
(define (filter predicate sequence)
  (cond ((null? sequence) null)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(filter odd? (list 1 2 3 4 5 6 7))
; '(1 3 5 7)

; accumualations can be implemented through
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(accumulate + 0 (list 1 2 3 4 5))

(accumulate * 1 (list 1 2 3 4 5))

(accumulate cons null (list 1 2 3 4 5))

; generate the sequence of integers in a given range,
; which we can do as follows:
(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(enumerate-interval 2 7)
; '(2 3 4 5 6 7)

; tree enumerator:
(define (enumerate-tree tree)
  (cond ((null? tree)null)
        ((not (pair? tree))(list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(enumerate-tree (list 1 (list 2 (list 3 4)) 5))

; refactor the original procedures:
(define (sum-odd-sq tree)
  (accumulate +
              0
              (map square
                   (filter odd?
                           (enumerate-tree tree)))))

(define (even-fib-r n)
  (accumulate cons
              null
              (filter even?
                      (map fib
                           (enumerate-interval 0 n)))))


(define (list-fib-squares n)
  (accumulate cons
              null
              (map square
                   (map fib
                        (enumerate-interval 0 n)))))

(list-fib-squares 10)
; '(0 1 1 4 9 25 64 169 441 1156 3025)

(define (prod-of-odd-sq sequence)
  (accumulate *
              1
              (map square
                   (filter odd? sequence))))


(prod-of-odd-sq (list 1 2 3 4 5))
; 225
         