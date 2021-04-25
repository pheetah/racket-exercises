#lang scheme
;russian peasants

(define (russki-peasants a b sum)
  (cond ((= b 0) sum)
    (else(if (even? b)
        (russki-peasants (* a 2) (/ b 2) sum)
        (russki-peasants (* a 2) (/ (- b 1) 2) (+ a sum)))))

)

(russki-peasants 57 86 0)