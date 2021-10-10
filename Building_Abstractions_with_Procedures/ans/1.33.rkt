#lang racket

(define (filtered-accumulate filter combiner null-value term a next b)
    (cond   ((> a b)    null-value)
            ((not (filter a))   (filtered-accumulate    filter combiner null-value
                                                        term (next a) next b))
            (else   (combiner   (term a)
                                (filtered-accumulate    filter combiner null-value
                                                        term (next a) next b)))
    )
)


(define (sum-prime a b)
    (define (prime-filter n)
        (define (smallest-divisor n)
            (find-divisor n 2))
        (define (find-divisor n test-divisor)
            (cond   ((> (sqr test-divisor) n) n)
                    ((divides? test-divisor n) test-divisor)
                    (else (find-divisor n (+ test-divisor 1)))
            )
        )
        (define (divides? a b)
            (= (remainder b a) 0))
        (define (prime? n)
            (= n (smallest-divisor n)))

        (prime? n)
    )
    (define (p x) x)
    (define (next x) (+ x 1))
    (filtered-accumulate prime-filter + 0 p a next b)
)

(define (sum-gcd n)
    (define (relative-prime-filter a)
        (define (gcd a b)
            (if (= b 0)
                a
                (gcd b (remainder a b)))
        )
        (= (gcd a n) 1)
    )
    (define (p x) x)
    (define (next x) (+ x 1))
    (filtered-accumulate relative-prime-filter * 1 p 1 next n)
)

(sum-gcd 8)