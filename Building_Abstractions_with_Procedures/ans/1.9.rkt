#lang racket

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

(define (+ a b)
    (if (= a 0)
        b
        (inc (+ (dec a) b))
    )
)
#|
    (+ 4 5)
    (inc (+ (dec 4) 5)))
    (inc (+ 3 5))
    (inc (inc (+ (dec 3) 5)))
    (inc (inc (+ 2 5)))
    (inc (inc (inc (+ (dec 2) 5))))
    (inc (inc (inc (+ 1 5))))
    (inc (inc (inc (inc (+ (dec 1) 5)))))
    (inc (inc (inc (inc (+ 0 5)))))
    (inc (inc (inc (inc 5))))
    (inc (inc (inc 6)))
    (inc (inc 7))
    (inc 8)
    9
|#

(define (s+ a b)
    (if (= a 0)
        b
        (s+ (dec a) (inc b))
    )
)
#|
    (s+ 4 5)
    (s+ (dec 4) (inc 5))
    (s+ 3 6)
    (s+ (dec 3) (inc 6))
    (s+ 2 7)
    (s+ (dec 2) (inc 7))
    (s+ 1 8)
    (s+ (dec 1) (inc 8))
    (s+ 0 9)
    9
|#