#lang scheme

;interleave lists

(define interleave
  (lambda (lst1 lst2)
    (if (null? lst1)
        lst2
        (cons (car lst1) (interleave lst2 (cdr lst1)) )
        ))
)

(interleave '(1 2) '(3 4 6 7))