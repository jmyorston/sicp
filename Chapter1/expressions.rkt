#lang racket
(require racket/pretty)
(display
 (+ (* 3 5)
    (- 10 6)))
(newline)
(display
 (+ (* 3
       (+ (* 2 4)
          (+ 3 5)))
    (+ (- 10 7) 6)))
(newline)
