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
