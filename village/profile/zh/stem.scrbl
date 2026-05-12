#lang scribble/report

@require{../../../literacy/zh.rkt}
@require{../../../literacy/architecture/stem.rkt}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-root-story{科学教育}

我的教育经历始于小学段的科学教育，
教学场景主要分为两大类，
它们共同验证了我对于跨学科教育可行性的思考：
@handbook-itemlist[
 #:style 'compact
 @item{@emph{实验驱动的义务教育科学课}，涵盖完整的授课、考试、评估、学期大作品、组织比赛等环节。}
 @item{小班@emph{项目制素质拓展课}，学生会经历定义问题、制定方案、协作试错，并最终迭代到呈现项目报告的完整探究过程。}]

@handbook-scenario{教学案例: 实验探究课《光合色素的奥秘》}

这是我给少儿科学教育的见面礼，
把高中生物必做实验搬到了小学课堂上。
动机很简单，小学科学教育也可以很硬核，
还能无缝衔接未来的学习。

作为机构的实验探究课，它是典型的生命科学与物质科学的联动；
作为学校科学课的实验环节，它适合安排给六年级学生，
让“化学家的工作”不再只是课本上的句子(@tamer-figure-ref{chlorophyll})。

@tamer-figure!['chlorophyll @list{叶绿素提取与层析实验@~ 课堂实况}]{
 @para{@stone-image["architecture/portfolio/stem/grinding.png" #:scale 0.24] @elem{研磨}}
 @para{@stone-image["architecture/portfolio/stem/filter.demo.png" #:scale 0.20] @elem{教师示范}}
 @para{@stone-image["architecture/portfolio/stem/filter.png" #:scale 0.24] @elem{过滤}}

 @para{@stone-image["architecture/portfolio/stem/spinach.png" #:scale 0.5] @elem{苏州同事的层析滤纸}}
 @para{@stone-image["architecture/water.vs.chlorophyll.png" #:scale 0.5] @elem{绿色水溶液@~ vs.@~ 叶绿素胶体}}
}

两种教学场景的关键流程的差异见@tamer-figure-ref{chlorophyll.act}，
左边适合探究性实验课，右边适合义务教育科学课。

@tamer-figure!['chlorophyll.act @list{《光合色素的奥秘》主题课@~ 活动图}
               @geo-vector[@chlorophyll.act]]

本主题课有个有趣的现象，
本地所有实验的层析效果都不明显；
但是苏州的同事按照我的课件、采购清单照着做，
效果就很明显(@fig-ref*[#:subidx 'd]{chlorophyll})。
我猜变数就出在菠菜这个非标准采购材料上。
因此，@tamer-figure-ref{chlorophyll.act}中我特别强调了层析实验的概率结果，
并让学生感受和理解，实验未达预期效果才是真实科研活动的常态。

本主题课最巧妙的安排其实还是跨年级协作。
六年级学《物质的变化》时，五年级碰巧在学《光》。
实验产生的叶绿素滤液也是个做光学实验的宝藏材料，
可以在标准教学过程中穿插一个对比实验(@fig-ref*[#:subidx 'e]{chlorophyll})。
让学生看到光线穿过叶绿素滤液时形成的光亮通路，不仅可以解释光沿直线传播，
还能自然引入胶体的光学性质话题，
甚至重新思考“物体的颜色之谜” 是否真像教科书里的结论那般简单。
@focus{科学课标更强调综合性，理应比理科单科更突出现象的非单一解释。}

@handbook-scenario{教学案例: PBL 学期大作品《剑龙骨架》}

这是与镇江培文实验学校合作的第一个完全由我独立主导的学期大作品(@fig-ref*[#:subidx 'a]{stegosaurus})。
选题呼应苏教版六年级科学《化石的奥秘》，
并结合孩子们关注的热门恐龙话题展开。
主要流程包括：@handbook-itemlist[
 #:style 'ordered

 @item{布置作业让学生自主上网调研“恐龙为什么这么大”，并写成小作文(@fig-ref*[#:subidx 'b]{stegosaurus})；}
 @item{认识恐龙的基本分类和身体结构，@focus{含批判性思维环节探讨学生收集到的观点是否靠谱}。
  比如：只要大气含氧量增大，生物就能长得很大；}
 @item{算术推算平方-立方定律，并实验验证；}
 @item{按照脊椎、内脏、躯干、口腔四个模块分组完成骨架模型(@fig-ref*[#:subidx 'c]{stegosaurus}-@fig-ref*[#:subidx 'f]{stegosaurus})；}
 @item{将相关知识写成《好奇心档案》打印给学生。}]

@tamer-figure!['stegosaurus @list{剑龙骨架大作品}]{
 @para{@stone-image["architecture/portfolio/stem/stegosaurus.png" #:scale 0.25] @elem{项目成品}}
 @para{@stone-image["architecture/portfolio/stem/paper.png" #:scale 0.55] @elem{课代表把小论文做成了手抄报}}

 @(let ([s 0.125])
    @(list @para{@stone-image["architecture/portfolio/stem/torso.png" #:scale s] @elem{躯干组}}
           @para{@stone-image["architecture/portfolio/stem/internal.png" #:scale s] @elem{内脏组}}
           @para{@stone-image["architecture/portfolio/stem/vertebra.png" #:scale s] @elem{脊椎组}}
           @para{@stone-image["architecture/portfolio/stem/head.png" #:scale s] @elem{口腔组}}))}

最终作品已足够用于学期末展览，但我本人并不完全满意。
由于总课时仅 6 次、合计 4.5 小时，很多原本计划展开的探究环节被迫压缩。
不过，学生整体参与度相当高，部分同学在协作过程中表现出了明显的组织与领导能力。
课后还有学生专门上网搜索我编写的《好奇心档案》，并认真告诉我：“没有发现雷同文章。”

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-reference[]
