#lang racket

(define (double x) (+ x x))
(define (halve x) (/ x 2.0))

(define (* a b)
    (cond   ((= b 0) 0)
            ((= b 1) a)
            ((if (even? b)
                    (double (* a (halve b)))
                    (+  a
                        (* a (- b 1)))))
    )
)

(* 2 4)
