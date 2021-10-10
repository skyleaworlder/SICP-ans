#lang racket

(define (compose f g)
    (lambda (x) (f (g x)))
)

(define square sqr)
(define (inc x) (+ x 1))

#| 49 |#
((compose square inc) 6)