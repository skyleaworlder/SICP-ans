#lang racket

#|
    T_{pq} = {
        a <- bq + aq + ap
        b <- bp + aq
    }
    T_{pq}^2 = {
        a <- (bp+aq)q + (bq+aq+ap)q + (bq+aq+ap)p
        b <- (bp+aq)p + (bq+aq+ap)q
    } = {
        a <- 2apq + 2bpq + 2aq^2 + bq^2 + ap^2
        b <- 2apq + bp^2 + bq^2 + aq^2
    } = {
        a <- b(2pq+q^2) + a(2pq+q^2) + a(p^2+q^2)
        b <- b(p^2+q^2) + a(2pq+q^2)
    }
    Therefore.
    {
        p' = p^2+q^2
        q' = 2pq+q^2
    }
|#

(define (fib n)
    (fib-iter 1 0 0 1 n)
)

(define (fib-iter a b p q count)
    (cond   ((= count 0) b)
            ((even? count)
                (fib-iter   a
                            b
                            (+ (* p p) (* q q))
                            (+ (* 2 p q) (* q q))
                            (/ count 2)))
            (else (fib-iter (+ (* b q) (* a q) (* a p))
                            (+ (* b p) (* a q))
                            p
                            q
                            (- count 1)))
    )
)

(fib 5)