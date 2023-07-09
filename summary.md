# Structure and Interpretation of Computer Programs (SICP) Summary by chatgpt

## Chapter 1: Building Abstractions with Procedures

### 1.1: The Elements of Programming

Key Takeaways:
- Every powerful language has primitive expressions (simple entities), means of combination (ways to compound simple elements), and means of abstraction (ways to abstract compound elements).
  - For example, in Scheme, a function to square a number can be defined and then used: 

```scheme
(define (square x) (* x x)) ;; defining a procedure to square a number
(square 5) ;; calling the procedure with 5 as an argument
```

### 1.2: Procedures and the Processes They Generate

Key Takeaways:
- Procedures, or functions, are not just recipes, they generate computational processes. These processes can be iterative (like a loop) or recursive (where the function calls itself).
  - For example, the factorial function can be defined recursively, where it calls itself, or iteratively, where a loop updates the state until the process is done:

```scheme
(define (factorial n) ;; recursive procedure for calculating factorial
    (if (= n 1)
        1
        (* n (factorial (- n 1)))))

(define (factorial-iter product counter max-count) ;; iterative procedure for calculating factorial
    (if (> counter max-count)
        product
        (factorial-iter (* counter product) (+ counter 1) max-count)))

(define (factorial n)
    (factorial-iter 1 1 n))
```


### 1.2.1: Linear Recursion and Iteration

Key Takeaways:
- A procedure is linear recursive if the amount of resources it needs grows linearly with the input. This is characterized by a process whose shape mirrors the shape of the data it processes.
- A procedure is linear iterative if it uses a fixed amount of resources (plus a linearly growing amount of time). This is characterized by a state that gets updated over the course of the process.


### 1.2.2: Tree Recursion

Key Takeaways:
- Tree recursion is when a procedure calls itself more than once. This can lead to very complex processes even with very simple procedures.
  - For example, the Fibonacci sequence is a classic case of tree recursion. Each value is the sum of the two preceding ones. This means to compute one value, you need to compute two others, each of which requires computing two others, and so on, leading to a rapidly growing tree of computations:

```scheme
(define (fib n) ;; tree recursive procedure for calculating fibonacci numbers
    (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                    (fib (- n 2))))))
```


### 1.2.3: Orders of Growth

Key Takeaways:
- The order of growth specifies an upper bound on the amount of resources a process requires as the input size increases. It's a simplified way to talk about how much time or space a process requires.
- The order of growth helps us understand whether a process can handle larger inputs, and how much additional resources it needs as the input grows.
  - For example, the tree-recursive Fibonacci procedure from above has exponential time complexity due to the number of times it computes the same subproblems.


### 1.2.4: Exponentiation

Key Takeaways:
- The section explores different strategies for computing exponents, providing examples of both iterative and recursive process solutions.
- The concepts of "successive squaring" and "fast exponentiation" are introduced, which are more efficient approaches for computing exponents. 

Code Snippet:
```scheme
(define (expt b n) ;; recursive procedure for calculating exponents
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (fast-expt b n) ;; fast exponentiation using recursive procedure
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
```

### 1.2.5: Greatest Common Divisors

Key Takeaways:
- This section discusses the method for computing the Greatest Common Divisor (GCD) of two integers using Euclid's Algorithm.
- This is an example of an algorithm where the size of the problem is reduced at each step.

Code Snippet:
```scheme
(define (gcd a b) ;; calculate greatest common divisor using Euclid's algorithm
  (if (= b 0)
      a
      (gcd b (remainder a b))))
```


### 1.2.6: Example: Testing for Primality

Key Takeaways:
- Discusses a basic method for checking the primality of a number: testing divisibility by all integers up to the square root of the number.
- Introduces the concepts of "randomness" and "probabilistic algorithms" by showing a method that tests the primality using Fermat's Little Theorem.

Code Snippet:
```scheme
(define (prime? n) ;; simple procedure for checking primality
  (define (divides? a b)
    (= (remainder b a) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (= n (find-divisor n 2)))

(define (fermat-test n) ;; probabilistic test for primality using Fermat's Little Theorem
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))
```
