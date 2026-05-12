#lang typed/racket/base

(provide (all-defined-out))

(require diafun/flowchart)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-flowchart! ASCII-Art.dia [#:start-name "字符画扫描线"
                                  #:block-desc #hasheq((<<whitespaces . "输出空格\n共 pos(n) - 1 个")
                                                       (<<characters . "输出字符\n共 span(n) 个")
                                                       (<<newline . "输出换行符"))] #:-
  (move-down 1.75 '>>|Read n|)

  [#:tree (move-down 1.5 '#:|(1 <= L <= n)|?)
   [=> (move-down 1.0 '|λDisplay Line|)
       (move-left 0.8)
       (L-step '#:|(1 <= L <= n)|? #false "for")]

   [=> (move-right 0.75 #false "N")
       (move-down '|λDisplay Line|)
       (move-down 0.75)
       (move-left '#:home)
       (move-down 0.75 'End$)]

   [=> (jump-right-up 2 1.5 '|^Display Line|)
       (move-down 1 '<<whitespaces)
       (move-down 1 '<<characters)
       (move-down 1 '<<newline)
       (move-down 1 'return$)]])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ main
  ASCII-Art.dia)
