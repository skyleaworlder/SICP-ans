#lang racket

(define (f1 n)
    (if (< n 3)
        n
        (+  (f1 (- n 1)
            (* 2 (f1 (- n 2))
            (* 3 (f1 (- n 3))))))
    )
)

#|
    a=1, b=2, c=3
    a=b
    b=c
    c=c+2b+3a
|#
(define (f2 n)
    (define (f2-iter a b c counter)
        (cond   ((= n 1) 1)
                ((= n 2) 2)
                ((= n 3) 3)
                ((= n counter) c)
                (else (f2-iter  b
                                c
                                (+ c (* 2 b) (* 3 a))
                                (+ counter 1)))
        )
    )
    (f2-iter 1 2 3 3)
)