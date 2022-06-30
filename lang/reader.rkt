#lang racket
(require "lexer.rkt")
(require "parser.rkt")
(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port)))
  (define module-datum `(module rsharp-mod rsharp/lang/expander
                          ,parse-tree))
                          ;',parse-tree))
  (datum->syntax #f module-datum))
(provide read-syntax)

(define (color-rsharp port offset racket-coloring-mode?)
  (define-values (str cat paren start end)
       (rpp-lexer port))
    (values str cat paren start end 0 racket-coloring-mode?))
(provide color-rsharp)

