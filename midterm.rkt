#lang racket

(define (adder x)
  (+ x 1)
)

(define (divider x)
  (/ x 2)
)

(define (generator x y)
  (let loop((l1 x)(l2 y))
    (cond ((= l2 0)
          l1
          l2)
          (else
           (if (even? l1)
                      (loop (divider l1) (divider l2))
                       (loop (adder l1) (adder l2)))))))

(generator 1 0)

;;(define (generator x y)
;  (let loop ((l1 x) (l2 y) (l3 last))
;   () )
;)
