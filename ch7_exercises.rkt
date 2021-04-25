#lang scheme

(define lists-compare?
  (lambda (compare l1 l2)
    (cond ((null? l1) #t)
          (else
           (if (compare (car l1) (car l2))
               (lists-compare? compare (cdr l1) (cdr l2))
               #f)))))

(define list-<
  (lambda (l1 l2)
    (lists-compare? < l1 l2)))

;list-< '(1 2 3 4) '(2 3 4 5))

(define filter
  (lambda (ok? lst)
    (cond ((null? lst)
           '())
          ((ok? (car lst))
           (cons (car lst) (filter ok? (cdr lst))))
          (else
           (filter ok? (cdr lst))))))

(filter even? '(1 4 5 7 8))

(define integers-from-to
  (lambda (start end)
    (cond ((> start end) '())
          (else
           (cons start (integers-from-to (+ 1 start) end))))))

;(integers-from-to 1 15)

;(filter odd? (integers-from-to 1 15))

(define first-elements-of
  (lambda (n list)
    (if (= n 0) '()
        (cons (car list)
              (first-elements-of (- n 1)
                                 (cdr list))))))

;(first-elements-of 5 (integers-from-to 1 15))

;(list-tail (integers-from-to 1 15) 10)


(define interleave ; interleaves lst1 and lst2, starting with
  (lambda (lst1 lst2) ; the first element of lst1 (if any)
  (if (null? lst1)
      lst2
      (cons (car lst1)
            (interleave lst2 (cdr lst1))))))

;(interleave '(1 2 3 4) '(5 6 7 8))

(define shuffle
  (lambda (deck size)
    (let ((half (quotient (+ size 1) 2))) (interleave (first-elements-of half deck)
                                                      (list-tail deck half)))))

(define multiple-shuffle
  (lambda (deck size times)
    (if (= times 0)
        deck
        (multiple-shuffle (shuffle deck size)
                          size (- times 1)))))

;(multiple-shuffle (integers-from-to 1 52) 52 1)

;(multiple-shuffle (integers-from-to 1 52) 52 8)

(define in-order?
  (lambda (l)
    (cond ((null? (cdr l)) #t)
          (else
           (if (< (car l) (cadr l))
               (in-order? (cdr l))
               #f)))))

(in-order? '(5 6 7 3))

(define shuffle-number-iter
  (lambda (n count shuffled)
    (cond ((in-order? shuffled) count)
          (else
           (shuffle-number-iter n (+ 1 count) (shuffle shuffled n))))))

(define shuffle-number
  (lambda (n)
    (shuffle-number-iter n 1 (shuffle (integers-from-to 1 n) n))))

;(shuffle-number 52)

;(shuffle-number 100)

;(multiple-shuffle (integers-from-to 1 100) 100 30)

























    
