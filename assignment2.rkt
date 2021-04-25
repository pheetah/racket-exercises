#lang scheme 

(define (readin my-list)
(for/list ([line (file->lines "wine.data.txt")])
  (append (cons line my-list))))

(define my-list (readin '()))

;(define (calculator raw-list class1 class2 class3))

;(print my-list)

;(print (caar my-list))

;(string->number (car (string-split (caar my-list) ",")))
;(cdr (string-split (caar my-list) ","))

;(cons (string->number (car (string-split (caar my-list) ","))) '())

(define (convert-to-number string-list number-list)
  (cond ((null? string-list) number-list)
        (else (convert-to-number (cdr string-list) (append (list (string->number (car string-list))) number-list ))
  )
))

;(convert-to-number (string-split (caar my-list) ",") '())



(define (string-to-number-list str-list num-list count)
  (cond ((null? str-list) num-list)
        (else (string-to-number-list (cdr str-list) (convert-to-number (string-split (caar str-list) ",") num-list) (+ count 1) ))
  )
)


(define converted-list (string-to-number-list my-list '() 0) )

;(print converted-list)

(define (list-maker input-list count converted-list)
  (let loop ((in-list input-list) (count count) (conv-list converted-list) (aux-list '()))
       (cond ((null? in-list) conv-list)
            (else (if (= count 14) (loop (cdr in-list) 1 (append (list (cons (car in-list) aux-list)) conv-list) '())
                      (loop (cdr in-list) (+ count 1) conv-list (cons (car in-list) aux-list))
                   ))
             )
))

(define number-list (list-maker converted-list 1 '()))
;(print number-list)

(define (classifier num-list start end class)
  (cond ((= start (+ end 1)) class)
        (else (classifier num-list (+ start 1) end  (append (list-ref num-list start) class) )  )
))

(define class1 (sort (classifier number-list 0 58 '()) <))
(define class2 (sort (classifier number-list 59 129 '()) <))
(define class3 (sort (classifier number-list 130 177 '()) <))
;(print class1)
;(print class2)
;(print class3)

(define (median-finder class)
  (cond ((even? (length class))
         ( / (+ (list-ref class (/ (length class) 2)) (list-ref class (- (/ (length class) 2) 1))) 2)
  )
  (else (list-ref class (/ (- (length class) 1) 2)))
  ))

;(median-finder class1)
;(median-finder class2)
;(median-finder class3)

(define (mean-finder lengthclass class sum)
  (cond ((null? class) (/ sum lengthclass))
        (else (mean-finder lengthclass (cdr class) (+ (car class) sum) )))
)

;(mean-finder (length class1) class1 0)
;(mean-finder (length class2) class2 0)
;(mean-finder (length class3) class3 0)

(define (variance concreteclass class sum)
  (cond ((null? class)  (/ sum (length concreteclass)))
        (else  (variance concreteclass (cdr class) (+ (expt (- (car class) (mean-finder (length concreteclass) concreteclass 0)) 2) sum)))
))

;(variance class1 class1 0)
;(variance class2 class2 0)
;(variance class3 class3 0)


;;;;;;;;;;; step 2
(define first-elements-of
  (lambda (n list)
    (if (= n 0) '()
        (cons (car list)
              (first-elements-of (- n 1)
                                 (cdr list))))))

(define interleave ; interleaves lst1 and lst2, starting with
  (lambda (lst1 lst2) ; the first element of lst1 (if any)
  (if (null? lst1)
      lst2
      (cons (car lst1)
            (interleave lst2 (cdr lst1))))))

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

(define shuffled-list (multiple-shuffle number-list (length number-list) 3))
;(print shuffled-list)

(define (list-splitter shuffled-list training-list test-list length count)
  (cond ((null? shuffled-list) test-list)
        (else (if (>= (* (/ 4 5) length) count) (list-splitter (cdr shuffled-list) (append (car shuffled-list) training-list) test-list length (+ count 1) )
                  (list-splitter (cdr shuffled-list) training-list (append (list (car shuffled-list)) test-list) length (+ count 1)))))
)

(define test-list (list-splitter shuffled-list '() '() (length shuffled-list) 1))
;(print test-list)

(define (random-accuracy testlist accuracy)
  (cond ((null? testlist) (* (/ accuracy (length test-list)) 100))
        (else (if (= (+ 1 (random 3)) (caar test-list)) (random-accuracy (cdr testlist) (+ accuracy 1))
                  (random-accuracy (cdr testlist) accuracy) )))
)

(exact->inexact (random-accuracy test-list 0))