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

(tamer-default-algorithm-label "Activity")

(tamer-indexed-block-hide-chapter-index #false)

(current-tongue 'en_US)
