#lang scribble/report

@require{literacy/literacy.rkt}
@require{stone/self/logo.rkt}

@(require geofun/vector)

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-title[
 #:documentclass 'scrreprt
 ;#:document-options '(openany oneside)
 #:figure @geo-scale[@geo-interdisciplinary-screen[] 0.42]
 #:hide-version? #true
 ]{架构师的跨学科课堂}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@texbook-frontmatter[#:docls-book? #false]

@include-section{literacy/about-stem.scrbl}
@include-section{literacy/about-plt.scrbl}

@handbook-smart-table[#:phantom? #true]

@texbook-mainmatter[#:docls-book? #false]

@texbook-appendix{附录}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-bonus-appendix[]

