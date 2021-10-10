#lang racket

(define good-enough-rate 0.01)

(define (good-enough? previous now)
    (<  (abs (/  (- now previous)
                    now))
        good-enough-rate)
)