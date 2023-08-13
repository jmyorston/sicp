# SICP

An attempt to work through the excercises in SICP.

## Set up tips

### **Viewing pdf's in vscode**

vscode-pdf is a simple plugin that makes it easy to read sicp in split screen.

### **Code formatting in vscode**

I havent figured out how to format in vscode using magic-racket, but using the racket [fmt](https://pkgs.racket-lang.org/package/fmt) package works with the run on save vscode extension as a workaround to format `.rkt` files:

```json
"commands": [
            {
                "match": "\\.rkt$",
                "cmd": "/Users/jamesyorston/formatracket.sh ${file}"
            }
        ]
```

and in the formatracket.sh file:

```bash
#!/bin/sh
raco fmt --width 40 $1 > temp.rkt && mv temp.rkt $1
```

### **Running the excercises**

and to run the procedures

```bash
racket sqrrt.rkt
```

## Excercise solutions:

<details>
  <summary> Chapter 1 </summary>

- [Exercise 1.1: Basics of Lisp/Scheme Expressions](Chapter1/exercises/ex1-1.md)
- [Exercise 1.2: Complex Expressions and Operator Precedence](Chapter1/exercises/ex1-2.md)
- [Exercise 1.3: Defining and Calling Simple Functions](Chapter1/exercises/ex1-3.md)
- [Exercise 1.4: Understanding Control Flow and Conditionals](Chapter1/exercises/ex1-4.md)
- [Exercise 1.5: Exploring Evaluation Strategies: Applicative vs. Normal Order](Chapter1/exercises/ex1-5.md)
- [Exercise 1.6: Understanding Recursive Procedures](Chapter1/exercises/ex1-6.md)
- [Exercise 1.7: Improving Algorithms: Square Root Approximation](Chapter1/exercises/ex1-7.md)
- [Exercise 1.8: Implementing Newton's Method for Cube Roots](Chapter1/exercises/ex1-8.md)
- [Exercise 1.9: Recursive vs. Iterative Process in Function Definitions](Chapter1/exercises/ex1-9.md)
- [Exercise 1.10: Analyzing Recursive Functions and Computational Complexity](Chapter1/exercises/ex1-10.md)
- [Exercise 1.11: Writing Recursive and Iterative Functions for Series](Chapter1/exercises/ex1-11.md)
- [Exercise 1.12: Implementing the Pascal's Triangle](Chapter1/exercises/ex1-12.md)
- [Exercise 1.13: Proving Properties of Recursive Sequences: Fibonacci Sequence](Chapter1/exercises/ex1-13.md)
- [Exercise 1.14: Analyzing the "count-change" Procedure](Chapter1/exercises/ex1-14.md)
- [Exercise 1.15: Approximating the Cube Root](Chapter1/exercises/ex1-15.md)
- [Exercise 1.16: Improving the Approximation of the Square Root](Chapter1/exercises/ex1-16.md)
- [Exercise 1.17: Expanding the Exponentiation Function](Chapter1/exercises/ex1-17.md)
- [Exercise 1.18: Logarithmic iterative multiplication procedure](Chapter1/exercises/ex1-18.md)
- [Exercise 1.19: Algorithm to compute the Fibonacci numbers using an iterative process efficiently](Chapter1/exercises/ex1-19.md)
- [Exercise 1.20: The Impact of Evaluation Strategies on Procedure Efficiency](Chapter1/exercises/ex1-20.md)
- [Exercise 1.21: Find the smallest divisor](Chapter1/exercises/ex1-21.md)
- [Exercise 1.22: Use the smallest-divisor procedure to find the smallest divisors](Chapter1/exercises/ex1-22.md)
- [Exercise 1.23: Optimise the smallest-divisor procedure](Chapter1/exercises/ex1-23.md)
- [Exercise 1.24: The Fermat Test](Chapter1/exercises/ex1-24.md)
- [Exercise 1.25: `expmod` using `fast-expt` and large intermediataries](Chapter1/exercises/ex1-25.md)
- [Exercise 1.26: Linear and logarithmic procedures](Chapter1/exercises/ex1-26.md)
- [Exercise 1.27: Carmichael numbers](Chapter1/exercises/ex1-27.md)
- [Exercise 1.28: Miller-rabin test for primality](Chapter1/exercises/ex1-28.md)
- [Exercise 1.29: Simpsons Rule](Chapter1/exercises/ex1-29.md)
- [Exercise 1.30: Iterative recursion for numerical integration](Chapter1/exercises/ex1-30.md)
- [Exercise 1.31: Iterative and recursive product procedures](Chapter1/exercises/ex1-31.md)
- [Exercise 1.32: Create recursive and iterative general accumulate procedure](Chapter1/exercises/ex1-32.md)
- [Exercise 1.33: Adding conditionals to the iterative general accumulate procedures](Chapter1/exercises/ex1-33.md)
- [Exercise 1.34: Constructing Procedures Using Lambda](Chapter1/exercises/ex1-34.md)
- [Exercise 1.35: Golden Ratio fixed point procedure](Chapter1/exercises/ex1-35.md)
- [Exercise 1.36: Using the fixed point procedure with logarithms](Chapter1/exercises/ex1-36.md)
- [Exercise 1.37: Infinite continued fractions with let](Chapter1/exercises/ex1-37.md)
- [Exercise 1.38: Euler's Continued Fraction Expansion](Chapter1/exercises/ex1-38.md)
- [Exercise 1.39: Lamberts tangent function](Chapter1/exercises/ex1-39.md)
- [Exercise 1.40: Cubic producure with newtons method](Chapter1/exercises/ex1-40.md)
- [Exercise 1.41: Double procedure to apply a procedure twice](Chapter1/exercises/ex1-41.md)
- [Exercise 1.42: Compose function for simple composition](Chapter1/exercises/ex1-42.md)
- [Exercise 1.43: Repeated functional composition](Chapter1/exercises/ex1-43.md)
- [Exercise 1.44: N-Fold Smoothing of a Function](Chapter1/exercises/ex1-44.md)
- [Exercise 1.45: Finding nth Roots with Fixed-Point Iteration and Average Damping](Chapter1/exercises/ex1-45.md)
- [Exercise 1.46: Iterative improvement function](Chapter1/exercises/ex1-46.md)

</details>

<details>
  <summary> Chapter 2 </summary>

- [Exercise 2.1: Make a rational constructor](Chapter2/exercises/ex2-1.md)
- [Exercise 2.2: Calculating Midpoint of a Segment in Scheme](Chapter2/exercises/ex2-2.md)
- [Exercise 2.3: Create rectangles](Chapter2/exercises/ex2-3.md)
- [Exercise 2.4: Alternative CDR and CAR functions](Chapter2/exercises/ex2-4.md)
- [Exercise 2.5: Cons, Car and CDR functions for $2^{a}3^{b}$ ](Chapter2/exercises/ex2-5.md)
- [Exercise 2.6: Defining one and two using _church calculus_ ](Chapter2/exercises/ex2-6.md)
- [Exercise 2.7: Define upper and lower bound selectors](Chapter2/exercises/ex2-7.md)
- [Exercise 2.8: Define a procedure to calculate the difference between two `intervals`](Chapter2/exercises/ex2-8.md)
- [Exercise 2.9: width of `intervals`](Chapter2/exercises/ex2-9.md)
- [Exercise 2.10: Divide by zero error handling for interval division](Chapter2/exercises/ex2-10.md)
- [Exercise 2.11: Testing different scenarios for `mul-interval`](Chapter2/exercises/ex2-11.md)
- [Exercise 2.12: `make-center-percent` interval constructor](Chapter2/exercises/ex2-12.md)
- [Exercise 2.13: Approximate percentage tolerance of the product of two intervals](Chapter2/exercises/ex2-13.md)
- [Exercise 2.14: Investigating the ambiguity of interval arithmetic](Chapter2/exercises/ex2-14.md)
- [Exercise 2.15: Analyzing the Precision of Equivalent Algebraic Expressions in Interval Arithmetic ](Chapter2/exercises/ex2-15.md)
- [Exercise 2.16: Challenges and Limitations of Interval Arithmetic](Chapter2/exercises/ex2-16.md)
- [Exercise 2.17: Last pair procedure](Chapter2/exercises/ex2-17.md)
- [Exercise 2.18: List reverse procedure](Chapter2/exercises/ex2-18.md)
- [Exercise 2.19: modifying the count-change procedure to handle currency denominations](Chapter2/exercises/ex2-19.md)

</details>
