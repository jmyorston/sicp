#lang racket

(define (make-interval a b) (cons a b))

(define (lower-bound x)
  (min (cdr x) (car x)))


(define (upper-bound x)
  (max (cdr x) (car x)))

(define (bound f x)
  (f (cdr x) (car x)))

(define (sub-interval x y)
  (make-interval (- (bound max x) (bound min y))
                 (- (bound min x) (bound max y))))


(define (width-interval x)
  (/ (- (bound max x)(bound min x)) 2))


(define (add-interval x y)
  (make-interval (+ (bound min x) (bound min y))
                 (+ (bound max x) (bound max y))))

(define (func-interval f x y)
  (define (min4 a b c d)
    (min (min a b) (min c d)))

  (define (max4 a b c d)
    (max (max a b) (max c d)))

  (let ((p1 (f (bound min x)(bound min y)))
        (p2 (f (bound min x)(bound max y)))
        (p3 (f (bound max x)(bound min y)))
        (p4 (f (bound max x)(bound max y))))
    (make-interval (min4 p1 p2 p3 p4) (max4 p1 p2 p3 p4))))

(displayln (add-interval (make-interval 2 4)(make-interval 3 5)))
(displayln (func-interval * (make-interval 2 4)(make-interval 3 5)))


(define (div-interval x y)
  (if (or (xero-check x) (xero-check y))
      (error "division by zero")
      (func-interval * x
                     (make-interval (/ 1.0 (upper-bound y))
                                    (/ 1.0 (lower-bound y))))))

(define (xero-check x)
  (and (< (lower-bound x) 0) (> (upper-bound x) 0)))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
 
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
 
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((w (* c p)))
    (make-center-width c w)))

(define (percent i)
  (/ (width i) (center i)))


