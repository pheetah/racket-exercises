#lang scheme


;(define perfect? (lambda (n)
;          )

; if d divides n
(define divides? (lambda (n d)
  (= (remainder n d) 0)))

(divides? 7 2)
