#lang racket

(define (double f)
    (lambda (x) (f (f x)))
)

(define (inc x) (+ x 1))

#| 21 |#
(((double (double double)) inc) 5)