#lang racket

(define (sqrt x)
    (define (average x y)
        (/ (+ x y) 2))
    (define (improve guess)
        (average guess (/ x guess)))
    (define (good-enough? guess)
        (<  (abs (- (sqr guess) x))
            0.001)
    )
    (define (iterative-improve good-enough? improve)
        (define (iterative-improve-iter guess)
            (if (good-enough? guess)
                guess
                (iterative-improve-iter (improve guess))
            )
        )
        (lambda (guess) (iterative-improve-iter guess))
    )
    ((iterative-improve good-enough? improve) 1)
)

(sqrt 9)