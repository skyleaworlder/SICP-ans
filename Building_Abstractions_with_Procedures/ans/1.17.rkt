#lang racket

(define square sqr)

(define (fast-expt base expo)
    (cond   ((= expo 0) 1)
            ((= expo 1) base)
            ((if (even? expo)
                    (sqr (fast-expt base (/ expo 2)))
                    (*  base
                        (fast-expt base (- expo 1)))))
    )
)

(fast-expt 2 4)