#lang scribble/report

@require{literacy/literacy.rkt}

@(require geofun/vector)
@(require geofun/avatar)

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-title[
 #:documentclass 'scrreprt
 #:subtitle "教学架构"
 #:figure @geo-scale[@bacteriophage-logo[128.0] 0.42]
 #:hide-version? #true
 ]{架构师的跨学科课堂}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@texbook-frontmatter[#:docls-book? #false]

@handbook-smart-table[#:phantom? #true]

@texbook-mainmatter[#:docls-book? #false]

@include-section{literacy/architecture/stem.scrbl}
@include-section{literacy/architecture/plt.scrbl}
@include-section{literacy/architecture/ideal.scrbl}
@include-section{literacy/architecture/lang.scrbl}
@include-section{literacy/architecture/bullseye.scrbl}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@;handbook-bonus-appendix[]
