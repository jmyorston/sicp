#lang racket
(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

(a-plus-abs-b 3 5)
(newline)
; this will result in 8
(a-plus-abs-b 3 -5)
; this will result in 8 
; due to the double negative as b is less than 0, so the operand returns - and then 3 - -5 is equal to 3+5