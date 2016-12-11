;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname subsets1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; subsets1: (listof Nat) -> (listof (listof Nat))
(define (subsets1 lon)
  (foldr (lambda (num accu) (append accu (map (lambda (z) (cons num z)) accu))) (list empty) lon))

;; Tests:
(define (lists-equiv? l1 l2)
  (and (= (length l1) (length l2))
       (andmap (lambda (x1) (ormap (lambda (x2) (equal? x1 x2)) l2)) l1)
       (andmap (lambda (x2) (ormap (lambda (x1) (equal? x1 x2)) l1)) l2)))

(check-expect (lists-equiv? (subsets1 empty) (list empty)) true)
(check-expect (lists-equiv? (subsets1 '(1)) '(() (1))) true)
(check-expect (lists-equiv? (subsets1 '(1 2 3)) '(()(1)(2)(3)(1 2)(1 3)(2 3)(1 2 3))) true)
