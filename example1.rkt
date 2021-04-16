#lang scheme

;linear iteration

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter n)
  (if (= counter (+ n 1))
      product
   (fact-iter (* product counter) (+ counter 1) n)
 )
)

(factorial 6)