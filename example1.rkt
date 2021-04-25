#lang scheme

(define lists-compare?
  (lambda (compare l1 l2)
    (cond ((null? l1) #t)
      (else
        (if (compare (car l1) (car l2))
          (lists-compare? compare (cdr l1) (cdr l2))
             #f)))))


(lists-compare? < '(1 2 5 4) '(2 3 4 5))
