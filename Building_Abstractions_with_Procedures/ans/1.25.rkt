#lang racket

(define square sqr)

(define (fast-expt base expo)
    (cond   ((= expo 0) 1)
            ((= expo 1) base)
            ((if (even? expo)
                    (sqr (fast-expt base (/ expo 2)))
                    (*  base
                        (fast-expt base (- expo 1)))))
    )
)

(define (expmod base exp m)
    (remainder (fast-expt base exp) m)
)

#|
    这样并不好，fast-expt 的复杂度为 lgn。
    lisp 是正则序的，在原本的 expmod 中，
    虽然 remainder 计算多次，但操作数都很小。
    反观这里，是把 fast-expt 的结果一次 remainder。
    很显然这个数字可能大到超乎想象。
|#