#lang scheme

; compare lists

(define list-<
  (lambda (l1 l2)
    (cond ((null? l1) #t)
          (else (if (< (car l1) (car l2))
                    (list-< (cdr l1) (cdr l2))
                    #f
                    ))))
)


;(list-< '(1 2) '(2 3))

; list creator

(define list-creator
  (lambda (x y)
    (cond ((> x y) '())
    (else (cons x (list-creator (+ x 1) y)))
    )))

(list-creator 1 10)