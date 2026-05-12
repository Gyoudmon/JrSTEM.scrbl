#lang typed/racket/base

(provide (all-defined-out))

(require racket/math)
(require racket/list)

(require geofun/vector)
(require geofun/markup)
(require diafun/flowchart)
(require pltfun/procedure)
(require plotfun/line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define artfont (desc-font (default-art-font) #:family 'fantasy))
(define monofont (desc-font (default-art-font) #:family 'monospace))

(define dkcyan-style (make-plot-mark-style #:pin-length 0.0 #:gap-length (&% 200) #:gap-angle pi/2 #:color 'DarkCyan))

(define edu-inner-body-text : Color (rgb* 'DimGray))
(define edu-inner-body-fill : Color (rgb* 'LightBlue))
(define edu-outer-body-fill : Color (rgb* 'Lavender))
(define edu-inner-iofill : Plt-Procedure-IO-Fill (λ [idx v t] 'AliceBlue))

(define make-timeline-real-desc : (->* (String Index) (Real) Plot-Mark->Description)
  (lambda [func-name N [scale 1.0]]
    (λ [pt datum font color transform]
      (define n (real->double-flonum (real-part pt)))
      (define c (rgb* color (/ (+ n 1.0) (exact->inexact (add1 N)))))
      (define unit (max (real-part (- (transform (+ n 1.0) 0.0) (transform n 0.0))) 0.0))
      (define arrow (geo-arrow pi (* unit 0.16) (* pi 0.5) #:fill c #:stroke #false))
      (define gobj (geo-dsfit (geo-scale (geo-text datum font #:color c) scale scale) unit unit))
      (define func (geo-sandglass (* unit 0.618) #:fill c #:stroke #false))
      (define name (geo-dsfit (geo-text func-name (desc-font font #:family 'math) #:color 'GhostWhite) func 0.95 0.24))
      (define fdia (geo-pin* 0.5 0.2 0.5 0.5 func name))

      (geo-vc-append #:gapsize 4.0 arrow fdia arrow gobj))))

(define edu-assignment-desc : (-> Symbol (-> Any String))
  (lambda [a]
    (λ [[v : Any]] : String
      (format "~s" v))))

(define edu-text : (-> Any Geo)
  (lambda [v]
    (geo-scale (geo-text #:id (edu-text-id v) #:color 'Black #:alignment 'center
                         (edu-text-datum v) monofont)
               2.5)))

(define edu-text-id : (-> Any Symbol)
  (lambda [v]
    (cond [(symbol? v) v]
          [(string? v) (string->symbol v)]
          [(procedure? v) (assert (object-name v) symbol?)]
          [else (string->symbol (format "~a" v))])))

(define edu-text-datum : (-> Any String)
  (lambda [v]
    (cond [(symbol? v) (symbol->string v)]
          [(procedure? v) (format "~a" (object-name v))]
          [else (format "~s" v)])))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define hh-mutate.dia
  (plt-flow-assignment #:read-desc "读取" #:write-desc "写入"
                       'x '|+ 1| (<span> null "x + " (<span> '([style . normal]) "1"))))


(define apply.dia
  (let* ([addends (list 7 6 4 2 1)]
         [sum (apply + addends)])
    (plt-procedure #:body-fill edu-outer-body-fill
                   (geo-scale (plt-procedure #:body-fill edu-inner-body-fill
                                             #:text-color edu-inner-body-text
                                             '+ (build-list (length addends)
                                                            (λ [[i : Index]] : Plt-Procedure-Label-Datum
                                                              (<span> null "a" (<sub> (number->string (add1 i))))))
                                             '|| addends sum)
                              0.36)
                   #(λ list) 'sum
                   (list + (reverse addends)) sum)))

(define count.dia
  (let* ([addends (list 8 6 4 4 1)]
         [eq4? (procedure-rename (λ [v] (eq? v 4)) '|x = 4|)])
    (plt-procedure #:body-fill edu-outer-body-fill
                   (geo-scale (geo-hc-append* #:gapsize 2.0
                                              (parameterize ([print-boolean-long-form #false])
                                                (for/list : (Listof Geo) ([y (in-list addends)])
                                                  (plt-procedure #:body-fill edu-inner-body-fill #:iofill edu-inner-iofill
                                                                 #:text-color edu-inner-body-text
                                                                 (assert (object-name eq4?) symbol?)
                                                                 #(#false) #false
                                                                 (list y) (eq4? y)))))
                              0.36)
                   #(pred? list) 'count
                   (list eq4? (reverse addends)) (count eq4? addends))))

(define timeline.dia
  (plot-integer-line #:range (cons 0 6)
                     #:mark-style dkcyan-style
                     #:mark-template (make-timeline-real-desc "L(n)" 6 1.0)
                     #:exclude-zero? #true
                     #:label "n"
                     #(null (4) (3 4) (5 3 4) (3 5 3 4) (9 3 5 3 4))))

(define read-line.dia
  (plt-flow-read #:reader read-line #:grid-width -1.0 #:grid-height -1.0
                 #:peek-size 20 #:output-desc (edu-assignment-desc 'line)
                 (open-input-bytes #"7 6 4 2 1\n1 2 7 8 9\n9 7 6 2 1\n1 3 2 4 5\n8 6 4 4 1\n1 3 6 7 9" 'rptin) 6))

(define pipeline.dia
  (let ([? (geo-art-text "?" #:stroke 'Crimson)]
        [geo-var (λ [[x : String]] : Geo (edu-text (string->symbol x)))])
    (define map.dia : Geo
      (geo-scale (plt-procedure 'map
                                `("f(x)" ,(geo-var "s"))
                                (geo-var "Maybe\nValues")
                                #("String ->\n(U Complex\n  False)" "Listof\nString")
                                "Listof\n(U Complex\n  False)")
                 0.9))
    (define width (geo-width map.dia))
    (define height (geo-height ?))
    (plt-procedure #:body-fill edu-outer-body-fill
                   (geo-vc-append #:gapsize 16.0
                                  map.dia
                                  (geo-cc-superimpose (geo-rounded-rectangle #:stroke (desc-stroke #:color 'Crimson #:dash 'long-dash)
                                                                             width (* height 1.618) (&% 12.5))
                                                      ?))
                   `(,(geo-var "s"))
                   (geo-var "Just\nValues")
                   #("Listof\nString")
                   "Listof\nNatural")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ main
  timeline.dia
  read-line.dia
  hh-mutate.dia

  (geo-hb-append #:gapsize 32.0
                 apply.dia count.dia pipeline.dia))
