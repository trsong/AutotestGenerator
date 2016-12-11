#lang racket
(require "testgen.ss")
(init 'IL)

;;*******************************************************
;; Q1
;; sum1: (listof Nat) -> Nat
(define (sum1 lon)
  (foldr + 0 lon))

(define test1 (list empty
                    (list 1)
                    (list 1 2 3)))
(testgen "1" "sum1.rkt" sum1 test1 'list)


;;*******************************************************
;; Q2
;; sum2: (listof Num) -> Num
(define (sum2 lon)
  (foldr + 0 lon))

(define test2 (list empty
                    (list 1.1)
                    (list 1.1 1.2 1.3 -1.3567)))
(testgen "2" "sum2.rkt" sum2 test2 'list 0.001)


;;*******************************************************
;; Q3
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


;; space: num -> “ “[length= 3*(num + 1)]
;; (space 0) => “   “
;; (space 1) => “      “
;; (space 2) => “         “
(define (space num)
  (build-string (* 3 (add1 num)) (lambda (x) #\space)))

;; bt2str: BT -> String
(define (bt2str bt)
  (local [(define (bt2str-helper t deep)
            (cond [(empty? t) (string-append (space deep) "empty")]
                  [else (format "~a (make-btnode ~a \n ~a \n ~a)"  (space deep) (btnode-key t) (bt2str-helper (btnode-left t) (add1 deep)) (bt2str-helper (btnode-right t) (add1 deep)))]))]
    (bt2str-helper bt 0)))




(define test3 (list empty
                    (make-btnode 1 empty empty)
                    (make-btnode 1 (make-btnode 2 empty empty) empty)))

(set-conversion btnode? bt2str)
(testgen "3" "tree-copy.rkt" tree-copy test3)
(reset-conversion) 


;;*********************************************************************************
;; Q4
;; subsets1: (listof Nat) -> (listof (listof Nat))
(define (subsets1 lon)
  (foldr (lambda (num accu) (append accu (map (lambda (z) (cons num z)) accu))) (list empty) lon))

(define test4 (list empty
                    (list 1)
                    (list 1 2 3)
                    (build-list 10 add1)))


(define template4 "
(result (local [(define result-ans (subsets ~a))
                        (define expect-ans ~a)
                        (define (lists-equiv? l1 l2)
                           (and (= (length l1) (length l2))
                           (andmap (lambda (x1) (ormap (lambda (x2) (equal? x1 x2)) l2)) l1)
                           (andmap (lambda (x2) (ormap (lambda (x1) (equal? x1 x2)) l1)) l2)))]
              (lists-equiv? result-ans expect-ans)
))
(expected true)
")

(testgen "4" "subsets1.rkt" subsets1 test4 'custom template4)



;;**********************************************************************************
;; Q5
;; my-reverse: (listof Any) -> (listof Any)
(define (my-reverse lst)
  (reverse lst))

(define test5 (list empty
                    (list 1)
                    (list 1 2 3 4)))

;; re-initialize 
(init 'IL '(reverse))
(testgen "5" "my-reverse.rkt" my-reverse test5 'list)


;;**********************************************************************************
;; Q6
;; bool-mystery: Boolean Boolean Boolean -> Boolean
(define (bool-mystery a b c)
  (or (and (not a) c) (and a b)))

 (define test6 '())
 (for ([a (list #\t #\f)])
     (for ([b (list #\t #\f)])
             (for ([c (list #\t #\f)])
				(set! test6 (cons (list a b c) test6)))))

(testgen "6" "bool-mystery" bool-mystery test6 )


;;*********************************************************************************
;; Q7
(require "my-gcd.rkt")

;;my-lcm: Nat Nat -> Nat
(define (my-lcm m n)
  (/ (* m n) (my-gcd m n)))


(define test7 (list (list 5 10)
                    (list 3 7)
                    (list 32767 1024)))
(set-require "my-gcd.rkt")
(testgen "7" "my-lcm.rkt" my-lcm test7)
(reset-require)


