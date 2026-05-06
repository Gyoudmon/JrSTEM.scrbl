#lang racket/base

(provide (all-defined-out))
(provide (all-from-out digimon/tamer))
(provide (rename-out [:rdr :desc]))

(require digimon/tamer)
(require geofun/resize)

(require scribble/manual)

(require (for-syntax racket/base))
(require (for-syntax syntax/parse))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-syntax (article-desc stx)
  (syntax-parse stx #:datum-literals []
    [(_ (~alt (~once (~seq #:keywords [kw ...]))
              (~once (~seq #:timestamp date)))
        ...)
     (syntax/loc stx
       (handbook-sidenote*
        (list (tt date) (linebreak))
        (list (handbook-word-count #:make-element elem) (linebreak))

        (let ([keywords (list kw ...)])
          (when (pair? keywords)
            (add-between #:splice? #true
                         #:before-first (list (linebreak))
                         (for/list ([keyword (in-list keywords)])
                           (racketkeywordfont (tech keyword)))
                         (list (linebreak)))))))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define /dev/src  (build-path "stone" "src"))
(define /proc/mem (build-path "stone" "mem"))

(define stone-image
  (lambda [path #:scale [scale 1.0]]
    (image #:scale (real->double-flonum scale)
           (digimon-path 'stone path))))

(define geo-vector
  (lambda [g [max-width 424] [max-height 0]]
    (geo-dsfit g max-width max-height)))

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
(define japanese
  (lambda [#:latex? [latex? 'auto] . contents]
    (cond [(symbol? latex?)
           (make-traverse-element
            (λ [get set!]
              (japanese #:latex? (handbook-latex-renderer? get)
                       contents)))]
          [(and latex?) (make-element "japanese" (list contents))]
          [else contents])))
