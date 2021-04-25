#lang racket

(define divides? (lambda (n d)
  (= (remainder n d) 0)))

(divides? 6 2)

(divides? 9 4)


(define (sum-of-divisors-iter n sum count)
  (cond ((= count n) sum)
        (else

         (if (divides? n count)
             (sum-of-divisors-iter n (+ count sum) (+ 1 count))
             (sum-of-divisors-iter n sum (+ 1 count))))))

(sum-of-divisors-iter 28 0 1)

(define (perfect? n)
  (= n (sum-of-divisors-iter n 0 1)))

(perfect? 28)

(perfect? 12)