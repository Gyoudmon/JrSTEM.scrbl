#lang scribble/book

@require{../../literacy/zh.rkt}
@require{../../stone/self/logo.rkt}

@(require geofun/vector)

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-title[
 #:documentclass 'scrbook
 #:document-options '(twoside openany (DIV . 12))
 #:subtitle "青少年科技课程体系与教学系统作品集"
 #:figure @geo-scale[@geo-interdisciplinary-screen[] 0.618]
 #:hide-version? #false
 ]{架构师的跨学科课堂}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@texbook-frontmatter[#:docls-book? #true]

@handbook-preface-section{序}

假设存在一个包罗万象的程序语言，
那我们学习任何一门具体的程序语言时会碰到的东西也一定能在学习这个假想的语言时碰到。
如果一定要从语言角度来回答“如何学习编程，并能适应智能时代”，
那就是学习这个包罗万象的假想语言，
并知道如何将它翻译成稳定的具体的可执行的代码。

已知的语言光谱至少包含数以百计的常用语言。
选择何种语言入门编程在实践上没有技巧，
全靠机缘巧合 (比如你碰巧遇到了擅长某某语言的启蒙老师)；
但理论上说，某些语言确实比另一些语言更适合用来入门。
综合多方因素考虑，
本课程体系重点着墨的语言分别趋近语言光谱的两个端点：
机器端的代表是 @tt{C++}；
数学端的代表是 @tt{Racket}；
如有特别需求，也可退而求次用 @tt{Python} 过渡。

@handbook-preface-subsection{致谢}

我从一名软件工程师转变成一名科学老师的契机很偶然。
那天在路口撞到了一条横穿马路的狗，
为开事故证明去了一条很少走的路，
等红灯时发现了本市唯一的一家 @tt{STEM} 教育公司。
于是，我内心深处的某种东西被激活了。

少有人走的路必定孤独。
在信念方面，最重要的肯定是我自己，
即便与这份事业直接相关的其他人都不真正理解我在干嘛，
我仍然有一颗能沉下来把这件事做好的心。
其次，是我活跃着的开源圈子：@tt{Racket} 语言社区。
在那里我接触到了很多关于程序语言理论、编程教育方面专业又前卫，
然而依然谦逊的资料和观点。
此外，教育圈同样在践行着理想但靠谱的教育理念的朋友和陌生人也时常会在闲聊时让我感觉不再孤单，
这是很珍贵的激励因素。

初学者的入门困境大同小异，但是青少年往往需要不同的解决方案。
在教学实践方面，学生显然是最重要的人。
他们让我学会了从孩子的角度思考问题、理论和技术应该朝哪个方向发力；
他们的收获、困惑，以及其他情绪亦会以最直白的方式呈现。

@handbook-smart-table[#:phantom? #true]

@$tex:newcounter:algorithm[]

@texbook-mainmatter[#:docls-book? #true]

@include-section{zh/philosophy.scrbl}
@include-section{zh/scaffold.scrbl}
@include-section{zh/plt.scrbl}
@include-section{zh/stem.scrbl}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@;handbook-bonus-appendix[]
