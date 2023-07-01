#lang racket
; tree recursion
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(displayln (f 0)) ;0
(displayln (f 1)) ;1
(displayln (f 2)) ;2
(displayln (f 3)) ;4
(displayln (f 4)) ;11
(displayln (f 5)) ;25
(displayln (f 6)) ;59

; if 4
; (define (f n)
; (if (< n 3)
;     n
;     (+ (f (- n 1)) ;4
;        (* 2 (f (- n 2))) ;4
;        (* 3 (f (- n 3)))))) ;3

(define (f-lin n)
  (define (f-iter m a b c)

    (define f-iter-this
      (+ a (* 2 b) (* 3 c)))

    (if (= n m)
        f-iter-this
        (f-iter (+ m 1)
                f-iter-this
                a
                b)))

  (if (< n 3) n (f-iter 3 2 1 0)))

; (f-lin 4)
; (f-iter 3 2 1 0)
; (f-iter-this + 2 2 0 )
; (f-iter 4 4 2 1)
; (f-iter-this + 4 4 3)
