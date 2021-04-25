#lang scheme

(define (deneme x)
  (cond ((= x 1) (values 1 2))
        (else x)))

(define (out a b) (deneme 1))