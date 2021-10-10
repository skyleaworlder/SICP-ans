#lang racket

(define (smallest-divisor n)
    (find-divisor n 2))

#|
    第二个 case 的意思是：如果 test-divisor 的 square 已经比 n 大了，
    那说明 n 的是一个素数，最小质因子是它自己。
|#
(define (find-divisor n test-divisor)
    (cond   ((> (sqr test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))
    )
)

(define (divides? a b)
    (= (remainder b a) 0))

#| 如果为 prime，那应该找不到 divisor 才对。 |#
(define (prime? n)
    (= n (smallest-divisor n)))

#|
    (prime? 199)    #|#t|#
    (prime? 1999)   #|#t|#
    (prime? 19999)  #|#f|#
|#