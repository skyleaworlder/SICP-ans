#lang racket

#|
    x |-> 1 + 1/x
    x = 1 + 1/x
    -> x^2 - x - 1 = 0
    -> x = (1 + \sqrt{5})/2, (1 - \sqrt{5})/2
|#
(define (fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))
        )
    )
    (try first-guess)
)

(define (f x)
    (+ 1 (/ 1 x)))

(fixed-point f 3)
