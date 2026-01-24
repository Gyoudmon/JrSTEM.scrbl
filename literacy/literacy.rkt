#lang racket/base

(provide (all-defined-out))
(provide (all-from-out digimon/tamer))
(provide (rename-out [:rdr :desc] [:out :type]))

(require digimon/tamer)
(require digimon/collection)

(require scribble/manual)

(require (for-syntax racket/base))
(require (for-syntax syntax/parse))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-syntax (handbook-portfolio-story stx)
  (syntax-parse stx #:datum-literals []
    [(_ argl ...)
     (syntax/loc stx
       (handbook-root-story argl ...))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Just in case for README.md
(enter-digimon-zone!)

(tamer-block-label-separator #false)
(tamer-block-label-tail "： ")
(tamer-block-label-style 'bold)

(tamer-default-figure-label "图")
(tamer-default-table-label "表")
(tamer-default-code-label "段")
(tamer-default-algorithm-label "算法")

(tamer-indexed-block-hide-chapter-index #false)

(current-tongue 'zh-Hans)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define /dev/src  (build-path "stone" "src"))
(define /proc/mem (build-path "stone" "mem"))

(define stone-image
  (lambda [path #:scale [scale 1.0]]
    (image (digimon-path 'stone path) #:scale scale)))

(define tamer-c++
  (lambda [id caption subpath start [end #px"END"] [ocness 'close-open]]
    (tamer-code! #:oc-ness ocness #:rootdir /dev/src
                 id caption subpath start end)))

(define tamer-c++-class
  (lambda [id caption subpath]
    (tamer-code-class #:rootdir /dev/src
                      id caption subpath)))

(define tamer-c++-function
  (lambda [id caption subpath #:ns [ns #false] #:subpattern [subpattern #false]]
    (tamer-code-function #:ns ns #:subpattern subpattern #:rootdir /dev/src
                         id caption subpath)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define idea
  (lambda argv
    (apply racketoutput argv)))

(define focus
  (lambda argv
    (apply racketvalfont argv)))

(define question
  (lambda argv
    (apply racketparenfont argv)))

(define mlink
  (lambda argv
    (apply litchar argv)))

(define hotkeys
  (lambda keys
    (elem #:style "keys"
          (string-join (add-between (map ~a keys) "+")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define tag:Racket (elem #:style "langTag" "Racket"))
(define tag:C++ (elem #:style "langTag" "C++"))
(define tag:Python (elem #:style "langTag" "Python"))
(define tag:Scratch (elem #:style "langTag" "Scratch"))
