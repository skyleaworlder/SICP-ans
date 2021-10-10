#lang racket

(define p-cnt 0)

(define (cube x) (* x x x))

(define (p x)
    (set! p-cnt (+ p-cnt 1))
    (-  (* 3 x)
        (* 4 (cube x)))
)

(define (sine angle)
    (if (not (> (abs angle) 0.1))
        angle
        (p (sine (/ angle 3.0)))
    )
)

(sine 12.15)
(print p-cnt)
#| 调用 5 次 |#

#|
    sine(a) = 3sine(a/3)-4sine^3(a/3)
    until abs(a/(3^n)) <= 0.1
    a ~= 0.1 * 3^n --> n = log_3(10a)
    但空间的增长却是：2^(log_3(10a))-2。
|#