#lang scheme

;; linear recursion
;(define (factorial n)
;  (if (= n 1) n
;      (* n (factorial (- n 1))))
;)

;(factorial 5)



;; linear iteration
(define (factorial sum n)
  (if (= n 1) sum
      (factorial (* sum n) (- n 1))
  )
)

(factorial 1 5)