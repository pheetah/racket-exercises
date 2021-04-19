#lang scheme

(define shuffle (lambda (mixed-list concrete-list)
      (let loop ((store '()) (mixed mixed-list) (concrete concrete-list))
          (if (null? (car mixed))
              store
              (loop (append (cons (caar mixed) concrete) store) (cdr mixed) concrete))
     )
))

(shuffle '((list 1 2)) '(3 4))