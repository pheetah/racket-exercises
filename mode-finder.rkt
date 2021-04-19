#lang scheme

(define mode
(lambda (l)
  (let loop ((l l) (max-freq (cdar l)) (mode (caar l)))
    (cond ((null? l) mode)
          (else (if (> max-freq (cdar l))
             (loop (cdr l) max-freq mode)
             (loop (cdr l) (cdar l) (caar l))
     )
    )
  ))
 )
)
