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

(define (miller-rabin-test n)
    (define (try-it a)
        (= (expmod a (- n 1) n) 1)
    )

    (try-it (+ 1 (random (- n 1))))
)

(define (fast-prime-miller-rabin? n times)
    (cond   ((= times 0) true)
            ((miller-rabin-test n)  (fast-prime-miller-rabin? n (- times 1)))
            (else false)
    )
)

(fast-prime-miller-rabin? 561 100)
(fast-prime-miller-rabin? 41041 100)
(fast-prime-miller-rabin? 825265 100)
