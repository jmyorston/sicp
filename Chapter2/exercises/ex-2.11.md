# Exercise 2.11: 
In passing, Ben also cryptically comments: "By testing the signs of the endpoints of the intervals, it is possible to break mul-interval into nine cases, only one of which requires more than two multiplications." Rewrite this procedure using Ben's suggestion.

After debugging her program, Alyssa shows it to a potential user, who complains that her program solves the wrong problem. He wants a program that can deal with numbers represented as a center value and an additive tolerance; for example, he wants to work with intervals such as 3.5 +/- 0.15 rather than [3.35, 3.65]. Alyssa returns to her desk and fixes this problem by supplying an alternate constructor and alternate selectors:

```scheme
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
 
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
 
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
```

Unfortunately, most of Alyssa's users are engineers. Real engineering situations usually involve measurements with only a small uncertainty, measured as the ratio of the width of the interval to the midpoint of the interval. Engineers usually specify percentage tolerances on the parameters of devices, as in the resistor specifications given earlier.

## Answer
We can re-write the formula as such to capture the 9 difference scenarios - we know this because the minimum and maximum of the resulting interval will be among the products of the combination of the endpoints.

Therefore, we can simplify `func-interval` by computing all four possible products and then selecting the smallest as the lower bound and the largest as the upper bound. This can be done using `min4` and `max4` helper functions:

```scheme
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
```

To change the implementation for percentages:

```scheme
(define (make-center-percent c p)
  (let ((w (* c p)))
    (make-center-width c w)))

(define (percent i)
  (/ (width i) (center i)))
```