#lang racket

(define (cbrt-item guess x)
    (if (good-enough? guess x)
        guess
        (cbrt-item (improve guess x)
                    x))
)

(define (good-enough? guess x)
    (< (abs (- (* guess guess guess) x)) 0.001)
)

(define (improve guess x)
    (average3   (* 2 guess)
                (/  x
                    (sqr guess))
    )
)

(define (average3 x y)
    (/ (+ x y) 3.0)
)

(define (cbrt x)
    (cbrt-item 1 x)
)
