#lang racket

(define (repeat f n)
    (cond   ((= n 1)    f)
            (else       (lambda (x) (f ((repeat f (- n 1)) x))))
    )
)

(define (compose f g)
    (lambda (x) (f (g x)))
)

(define (repeat-c f n)
    (cond   ((= n 1)    f)
            (else       (compose f (repeat-c f (- n 1))))
    )
)

((repeat sqr 2) 5)
((repeat-c sqr 2) 5)