#lang racket

(define (cont-frac n d k)
    (define (cont-frac-iter i k)
        (cond   ((= i k)    (calcu (n i) (d i) (d i)))
                (else       (calcu (n i) (d i) (cont-frac-iter (+ i 1) k)))
        )
    )
    (define (calcu N D FRAC)
        (/ N (+ D FRAC)))
    (cont-frac-iter 1 k)
)

(define (n i) i)
(define (d i)
    (cond   ((= (remainder i 3) 2)  (* (/ (+ i 1) 3) 2))
            (else 1)
    )
)

(define (e iter-num)
    (+ 2.0 (cont-frac n d iter-num))
)
