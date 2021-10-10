#lang racket

(define (max-2-sum a b c)
    (cond   ((and (< a b) (< a c))
                (+ b c)
            )
            ((and (< b a) (< b c))
                (+ a c)
            )
            (else (+ a b))
    )
)