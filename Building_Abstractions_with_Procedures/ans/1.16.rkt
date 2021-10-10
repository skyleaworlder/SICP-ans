#lang racket

(define (fast-expt2 base expo)
    (fast-expt-iter 1 base expo)
)

#| result 即为 a |#
(define (fast-expt-iter result base counter)
    (if (= counter 0)
        result
        (fast-expt-iter (* result base) base (- counter 1))
    )
)