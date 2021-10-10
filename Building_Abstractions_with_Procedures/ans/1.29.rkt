#lang racket

(define (int-simpson f a b n)
    (*  (/ (h-simpson a b n) 3.0)
        (y-sum-simpsom f a b n)
    )
)

(define (h-simpson a b n)
    (/ (- b a) n))

(define (y-sum-simpsom f a b n)
    (+  (yk f a b n 0)
        (y-sum-simpsom-iter f a b n 1)
        (yk f a b n n)
    )
)

(define (y-sum-simpsom-iter f a b n k)
    (cond   ((> k (- n 1))  0)
            ((even? k)      (+  (* 2 (yk f a b n k))
                                (y-sum-simpsom-iter f a b n (+ k 1))))
            (else           (+  (* 4 (yk f a b n k))
                                (y-sum-simpsom-iter f a b n (+ k 1))))
    )
)

(define (yk f a b n k)
    (f  (+   a
            (* k (h-simpson a b n))
        )
    )
)

(define (cube x) (* x x x))

(int-simpson cube 0 9 1)
(int-simpson cube 0 9 10)
(int-simpson cube 0 9 100)
(int-simpson cube 0 9 1000)