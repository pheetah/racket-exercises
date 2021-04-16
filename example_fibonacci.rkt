#lang scheme

;fibonacci numbers

(define (fibonacci n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fibonacci (- n 2)) (fibonacci (- n 1)) ))
  )
)

(fibonacci 8)