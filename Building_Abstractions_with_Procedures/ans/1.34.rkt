#lang racket

(define (f g)
    (g 2))

(f f)

#|
    (f f) = (f 2) = (2 2)
    本来第一个 op 应该是一个 procedure，但是却是一个 number。
|#