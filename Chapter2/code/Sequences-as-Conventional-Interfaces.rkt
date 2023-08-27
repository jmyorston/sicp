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
(provide accumulate)
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
(provide enumerate-interval)
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

(displayln "*********************************")
(displayln "******* Nested Mappings *********")
(displayln "*********************************")

(provide prime?)
(define (prime? n)
  (if (<= n 1)
      #f
      (let loop ([i 2])
        (if (> (* i i) n)
            #t
            (if (= 0 (remainder n i))
                #f
                (loop (+ i 1)))))))


(define n 6)

; procedure to create a list of all the possible pairs
(accumulate append
            null
            (map (λ (i)
                   (map (λ (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n)))
; '((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4) (6 1) (6 2) (6 3) (6 4) (6 5))

; simplified version of above procedure
(provide flatmap)
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

; filter procedure to check whether sum of pair is prime?
(provide prime-sum?)
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

; create a triple of the pair + sum of the pair values
(provide make-pair-sum)
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (make-pair pair)
  (list (car pair) (cadr pair) ))

; complete procedure:
(provide prime-sum-pairs)
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (λ (i)
                  (map (λ (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))

(prime-sum-pairs 6)

; procedure to generate all permutations:
(provide permutations)
(define (permutations s)
  (if (null? s)                    ; empty set?
      (list null)                   ; sequence containing empty set
      (flatmap (λ (x)
                 (map (λ (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(permutations '(1 2 3))

; -------------------------------------
;           Exercise 2.40
; -------------------------------------
(displayln "*** Exercise 2.40 ***")

(define (unique-pairs n)
  (flatmap
   (λ (i)
     (map (λ (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(unique-pairs 6)

(define (prime-sum-pairs2 n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

(prime-sum-pairs2 6)

; -------------------------------------
;           Exercise 2.41
; -------------------------------------
(displayln "*** Exercise 2.41 ***")

(define (unique-triplets n)
  (flatmap (λ (i)
             (map (λ (jk-pair) (append jk-pair (list i)))
                  (flatmap (λ (j)
                             (map (λ (k) (list k j))
                                  (enumerate-interval 1 (- j 1))))
                           (enumerate-interval 1 (- i 1)))))
           (enumerate-interval 1 n)))

(unique-triplets 6)

(define (sum-triplet triplet)
  (+ (car triplet) (cadr triplet) (cadr (cdr triplet))))

(sum-triplet '(1 2 3))

(define (make-trip-sum trip)
  (append trip (list (sum-triplet trip))))

(define (trip-sum-equal-s s)
  (λ (triplet)(= (sum-triplet triplet)s)))

(define (order-trips n s)
  (map make-trip-sum
       (filter (trip-sum-equal-s s)
               (unique-triplets n))))

(order-trips 6 6)

