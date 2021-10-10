#lang racket

(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a))))
    )
    (iter a 0)
)

(define (p x) x)
(define (next x) (+ x 1))

(sum p 1 next 100)