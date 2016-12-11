;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname tree-copy) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; A BT is one of:
;; empty, or
;; (make-btnode key left right) ,where left and right are also BTs
(define-struct btnode (key left right))

;; tree-copy: BT -> BT
(define (tree-copy t)
	(cond [(empty? t) empty]
               [else (make-btnode (btnode-key t) 
                                  (tree-copy (btnode-left t))  
                                  (tree-copy (btnode-right t)))]))

;; Tests
(check-expect (tree-copy empty) empty)
(check-expect (tree-copy (make-btnode 1 empty empty))
              (make-btnode 1 empty empty))
(check-expect (tree-copy (make-btnode 1 (make-btnode 2 empty empty) empty ))
              (make-btnode 1 (make-btnode 2 empty empty) empty))

