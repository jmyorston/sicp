# SICP
An attempt to work through the excercises in SICP.

## Set up tips

### __Viewing pdf's in vscode__
vscode-pdf is a simple plugin that makes it easy to read sicp in split screen.

### __Code formatting in vscode__
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

### __Running the excercises__
and to run the procedures
```bash
racket sqrrt.rkt
```

## Excercise solutions:
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
- [Exercise 1.20: The Impact of Evaluation Strategies on Procedure Efficiency](Chapter1/exercises/ex1-19.md)