#lang racket

(define (product-induct f a next b)
    (if (> a b)
        1
        (* (f a) (product-induct f (next a) next b))
    )
)

(define (calcu-pi n)
    (* 4.0 (product-induct f 0 next n))
)

#| f: x -> y |#
(define (f x)
    (define (nume x)
        (cond   ((= x 0)    2)
                ((even? x)  (+ x 2))
                (else       (+ x 3))))
    (define (deno x)
        (cond   ((even? x)  (+ x 3))
                (else       (+ x 2)))
    )

    (/ (nume x) (deno x))
)

(define (next x) (+ x 1))

(calcu-pi 10000)