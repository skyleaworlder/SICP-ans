#lang racket

(define (expmod base exp m)
    (cond   ((= exp 0) 1)
            ((even? exp)    (remainder (sqr (expmod base (/ exp 2) m))
                                        m))
            (else           (remainder (*   base
                                            (expmod base (- exp 1) m))
                                        m))
    )
)

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a)
    )

    (try-it (+ 1 (random (- n 1))))
)

(define (fast-prime-fermat? n times)
    (cond   ((= times 0) true)
            ((fermat-test n)  (fast-prime-fermat? n (- times 1)))
            (else false)
    )
)

(fast-prime-fermat? 561 100)
(fast-prime-fermat? 41041 100)
(fast-prime-fermat? 825265 100)
