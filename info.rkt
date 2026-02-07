#lang info

(define collection "JrSTEM")
(define pkg-desc "Online Articles released for Office Account")

(define deps '("digimon" "graphics"))
(define build-deps '("digimon" "scribble-lib" "racket-doc"))

(define version "1.0")
(define pkg-authors '("WarGrey G. Ju"))
(define test-omit-paths 'all)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define typesettings
  '(["about.scrbl" xelatex]))
