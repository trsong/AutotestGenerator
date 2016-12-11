;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname my-lcm) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require "my-gcd.rkt")

;;my-lcm: Nat Nat -> Nat
(define (my-lcm m n)
  (/ (* m n) (my-gcd m n)))

