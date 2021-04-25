#lang scheme

(loop go ([n 42] [sum 0 #:inherit])
    (cond
      [(= n 0) sum]
      [(even? n) (go (sub1 n) #:sum (+ sum n))]
      [else (go (sub1 n))]))