#lang racket/base

(provide (all-defined-out))
(provide (all-from-out "literacy.rkt"))

(require digimon/collection)

(require "literacy.rkt")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Just in case for README.md
(enter-digimon-zone!)

(tamer-block-label-separator #false)
(tamer-block-label-tail " ")
(tamer-block-label-style 'bold)

(tamer-default-figure-label "图")
(tamer-default-table-label "表")
(tamer-default-code-label "段")
(tamer-default-algorithm-label "活动")

(tamer-indexed-block-hide-chapter-index #false)

(current-tongue 'zh-Hans)
