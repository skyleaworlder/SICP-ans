#lang racket

#|
    使用 square 可以只计算一个 expmod 从而得到平方结果。
    但如果不用，那一次 expmod 在 even 时就会被拆解成两个 n/2 规模的 expmod。
    虽然一次只增加了一倍，
    但 expmod 在有 square 的执行时间是用 N/(2*2*...*2) = 1 计算出来的 t = lgN。
|#