#lang racket

#| 没什么好说的。
    在 a-plus-abs-b 中，用 if 这个 “三目运算” 选择 a b 的 op。
    a b 前原本应该是运算符的位置，却也可以用复合表达式。
|#
(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b)
)

#| 这个和上面是一样的。 |#
(define (choose-op b)
    (if (> b 0) + -)
)
(define (a-plus-abs-b-new a b)
    ((choose-op b) a b)
)