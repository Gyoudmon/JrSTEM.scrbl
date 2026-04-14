#lang scribble/report

@require{literacy/zh.rkt}

@(require geofun/vector)
@(require geofun/avatar)

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-title[
 #:documentclass 'scrreprt
 #:document-options '((DIV . 12))
 #:subtitle "教育架构学"
 #:figure @geo-scale[@bacteriophage-logo[128.0] 0.42]
 #:hide-version? #true
 ]{架构师的跨学科课堂}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@texbook-frontmatter[#:docls-book? #false]

@handbook-smart-table[#:phantom? #true]

@$tex:newcounter:algorithm[]

@texbook-mainmatter[#:docls-book? #false]

@include-section{literacy/architecture/stem.scrbl}
@include-section{literacy/architecture/plt.scrbl}
@include-section{literacy/architecture/func.scrbl}
@include-section{literacy/architecture/lang.scrbl}
@include-section{literacy/architecture/bullseye.scrbl}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@;handbook-bonus-appendix[]
