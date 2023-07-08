```scheme
(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (func a)
  (sum-of-squares (+ a 1) (* a 2))
```

# Normal Order
- In short, fully expand and then reduce.
```
(func 5)
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square (+ 5 1)) (square (* 5 2)))
(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))    
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```

# Applicative order
- In short, evaluate the arguments and then apply.
```
(func 5)
(sum-of-squares (+ 5 1) (* 5 2))
(sum-of-squares 6 10)
(+ (square 6) (square 10))
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```
