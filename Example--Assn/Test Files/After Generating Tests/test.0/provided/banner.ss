
#lang racket

(require racket/set)

(define banned-fcns (make-hash))
(define error-message "(~a ...) is not allowed.")

;; Ban system 
(define-syntax (ban stx)
  (syntax-case stx ()
    [(_) #'(void)]
    [(_ toban ...)
     (with-syntax ([(new-names ...) ; construct new names
                    (map (lambda (syn)
                           (datum->syntax stx (string->symbol (string-append "banned-" (format "~a" (syntax->datum syn))))))
                         (syntax->list #'(toban ...)))])
       #'(begin (define new-names
                  (lambda args
                     (error (format error-message (quote toban)))))                  
                ...              
                (provide (rename-out [new-names toban])) ...
                (hash-set! banned-fcns (quote toban) (quote toban)) ...))]))


(ban reverse )