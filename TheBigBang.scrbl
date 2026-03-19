#lang scribble/report

@require{literacy/zh.rkt}

@(require geofun/vector)
@(require geofun/avatar)

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-title[
 #:documentclass 'scrreprt
 #:document-options '((DIV . 12))
 #:subtitle "数字宇宙大爆炸"
 #:figure @geo-scale[@bacteriophage-logo[128.0] 0.42]
 #:hide-version? #true
 ]{架构师的跨学科课堂}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@texbook-frontmatter[#:docls-book? #false]

@handbook-preface-section{序}

本合集假设存在一个包罗万象的程序语言，
它的核心概念是函数和对象本身。
如果一定要从语言角度来回答“智能时代如何学习编程”，
那就是学习这个包罗万象的假想语言，
并知道如何将它翻译成稳定的具体的可执行的代码。

@handbook-smart-table[#:phantom? #true]

@$tex:newcounter:algorithm[]

@texbook-mainmatter[#:docls-book? #false]

@include-section{literacy/bang/language.scrbl}

@texbook-appendix{附录}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-bonus-appendix[#:bibliography-section? #false]
