#lang scheme

; fibonacci example 2 - use linear iteration instead of tree recursion

(define (fibonacci n)
  (fib-iter 1 0 n)
)

(define (fib-iter a b n)
  (cond ((= n 1) a)
  (else(fib-iter (+ a b) a (- n 1)))
  )
)


(fibonacci 6)