#lang racket

(define (prime1? n)
    (= n (smallest-divisor1 n))
)

(define (prime2? n)
    (= n (smallest-divisor2 n))
)

(define (smallest-divisor1 n)
    (find-divisor1 n 2))

(define (smallest-divisor2 n)
    (find-divisor1 n 2))

(define (find-divisor1 n test-divisor)
    (cond   ((> (sqr test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor1 n (+ test-divisor 1)))
    )
)

(define (find-divisor2 n test-divisor)
    (cond   ((> (sqr test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (find-divisor2 n (next test-divisor)))
    )
)

(define (next x)
    (cond   ((= x 2) 3)
            (else (+ x 2))
    )
)

(define (divides? a b)
    (= (remainder b a) 0)
)

(define (test-case1 start-time)
    (prime1? 1171432692373 )
    (print (- (current-milliseconds) start-time))
)

(define (test-case2 start-time)
    (prime2? 1171432692373 )
    (print (- (current-milliseconds) start-time))
)

(test-case1 (current-milliseconds))
(newline)
(test-case2 (current-milliseconds))

#|
    感觉并没有特别大的差别。
    我认为是 next 为函数、且仍需要判断导致，所以显示出来基本上是 3 / 2 的关系。
|#