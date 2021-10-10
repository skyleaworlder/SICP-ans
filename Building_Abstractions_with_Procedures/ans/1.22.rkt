#lang racket

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

(define (report-prime elapsed-time)
    (print " *** ")
    (print elapsed-time)
)

(define (fail-prime)
    (print " failed! ")
)

(define (search-for-primes lower-bound upper-bound start-time counter)
    (cond   ((= counter 0)              (report-prime (- (current-milliseconds) start-time)))
            ((> lower-bound upper-bound) fail-prime)
            ((prime? lower-bound)        (search-for-primes  (+ lower-bound 1)
                                                            upper-bound
                                                            start-time
                                                            (- counter 1)))
            (else                       (search-for-primes  (+ lower-bound 1)
                                                            upper-bound
                                                            start-time
                                                            counter))
    )
)

