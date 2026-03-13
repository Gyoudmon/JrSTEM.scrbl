#lang scribble/report

@require{literacy/literacy.rkt}

@(require geofun/vector)
@(require geofun/avatar)

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-title[
 #:documentclass 'scrreprt
 #:document-options '((DIV . 12))
 #:subtitle "数字世界的首目录"
 #:figure @geo-scale[@bacteriophage-logo[128.0] 0.42]
 #:hide-version? #true
 ]{架构师的跨学科课堂}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@texbook-frontmatter[#:docls-book? #false]

@handbook-preface-section{序}

正式学编程之前，
我们先跟计算机交个朋友——它是你在数字世界的家。

本合集收录所有编程预科课程，
它们会带你窥探各路跨界精英如何使用计算机构建高效工作流。
本系列课程适用于所有学生，
只要他们尚未学习相关知识。
因此，这是我的学生的起点课程。

@handbook-smart-table[#:phantom? #true]

@$tex:newcounter:algorithm[]

@texbook-mainmatter[#:docls-book? #false]

@include-section{literacy/home/shell.scrbl}

@texbook-appendix{附录}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-bonus-appendix[#:bibliography-section? #false]
