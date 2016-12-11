;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname sum1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; sum1: (listof Nat) -> Nat
(define (sum1 lon)
	(foldr + 0 lon))

;;Tests
(check-expect (sum1 empty) 0)
(check-expect (sum1 '(1)) 1)
(check-expect (sum1 '(1 2 3)) 6)
