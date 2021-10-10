#lang racket

(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner   (term a)
                    (accumulate combiner null-value term
                                (next a) next b))
    )
)

(define (sum term a next b)
    (accumulate + 0 term a next b))

(define (product term a next b)
    (accumulate * 1 term a next b))

#| too easy |#
(define (it-accumulate combiner null-value term a next b)
    (define (accumulate-iter a result)
        (if (> a b)
            result
            (accumulate-iter    (next a)
                                (combiner (term a) result))
        )
    )
    (accumulate-iter a null-value)
)