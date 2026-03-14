#lang info

(define collection "JrSTEM")
(define pkg-desc "Online Articles about My Education")

(define deps '("digimon" "graphics"))
(define build-deps '("digimon" "scribble-lib" "racket-doc"))

(define version "1.0")
(define pkg-authors '("WarGrey G. Ju"))
(define test-omit-paths 'all)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define scribblings
  '(["Gyoudmon.scrbl" (main-doc multi-page)]))

(define typesettings
  '(["Architecture.scrbl" xelatex]
    ["Home.scrbl" xelatex]))
