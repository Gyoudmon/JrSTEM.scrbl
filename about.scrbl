#lang scribble/report

@require{literacy/literacy.rkt}

@(require geofun/vector)
@(require geofun/avatar)

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-title[
 #:documentclass 'scrreprt
 #:subtitle "我和我的跨学科教育"
 #:figure @geo-scale[@bacteriophage-logo[128.0] 0.42]
 #:hide-version? #true
 ]{架构师的跨学科课堂}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@texbook-frontmatter[#:docls-book? #false]

@handbook-smart-table[#:phantom? #true]

@texbook-mainmatter[#:docls-book? #false]

@include-section{literacy/about-stem.scrbl}
@include-section{literacy/about-plt.scrbl}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@;handbook-bonus-appendix[]
