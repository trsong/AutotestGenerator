;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname my-reverse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; my-reverse: (listof Any) -> (listof Any)
(define (my-reverse lst)
(reverse lst))

;;Tests
(check-expect (my-reverse empty) empty)
(check-expect (my-reverse (list 1)) (list 1))
(check-expect (my-reverse (list 1 2 3 4)) (list 4 3 2 1))
