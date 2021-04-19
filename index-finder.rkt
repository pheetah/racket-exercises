#lang scheme


(define indexer (lambda(x)
               (list-ref x 1)))

(indexer '(1 2 3))

(list-ref (list 'a 'b 'c) 1)