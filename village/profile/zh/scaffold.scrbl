#lang scribble/manual

@require{../../../literacy/zh.rkt}
@require{scaffold.rkt}

@(require geofun/vector)

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-root-story{教育脚手架系统}

我们的青少年计算机科学教育需要一套既能管理认知负荷、又不会牺牲孩子表达能力的脚手架。
碰巧，软件工程提供了不少以读者或用户为中心的方法论。
譬如，@bold{文学式编程}、@bold{行为驱动开发}、@bold{文档驱动开发}。
它们强调沟通效果与代码质量，天然适用于教学场景，
也潜移默化地影响了我对教学过程的设计：
帮助学生建立编程与写作的联系，
并为课后复习与表达训练提供优质素材。

@(let ([s 0.5])
   @tamer-figure!['dredging "我独立拓荒出的疏浚工控系统(C++)"]{
 @(para @elem{@hspace[1]@(stone-image "architecture/portfolio/DTPM.png" #:scale s)})
 @(para @elem[] @elem{疏浚工程可视化})
 @para[]
 @para[]
 @(para @elem{@$tex:hspace{-2ex}@(stone-image "architecture/SCADA.png" #:scale s)}
        @elem{疏浚施工现场@hspace[1]})})

于是，
我从自己的软件实践中(@fig-ref{dredging})演化出了一整套理念自洽的教学工具软件(@tab-ref{asset})。

@tamer-table!['asset "我自研的理念自洽的教育脚手架软件集"]{
 @(list @bold{软件项目}  @bold{写作语言}       @bold{用户接口}           @bold{教育职能})
 @(list @elem{JrLab}    @elem{C++}           @elem{C++}               @elem{@emph{语义}驱动的创作环境})
 @(list @elem{wizarmon} @elem{Typed Racket}  @elem{CLI, VSCode按钮}    @elem{构建复杂学生项目})
 @(list @elem{spec}     @elem{Typed Racket}  @elem{CLI, VSCode按钮}    @elem{测评比赛题解程序})
 @(list @elem{geofun}   @elem{Typed Racket}  @elem{Typed Racket, DSL} @elem{生成学术/技术图})
 @(list @elem{tamer}    @elem{Racket}        @elem{Scribble, Racket}  @elem{编写教案、书籍})}

@handbook-scenario{JrLab: 语义驱动的创作环境}

@tt{JrLab}是直接从我那套疏浚工控系统中生长出来的教学用游戏引擎。
学生入门阶段用它完成项目制课程作品(@tamer-figure-ref{pbl})，
出师后可继续探索高级跨学科知识，或只是做个小游戏犒劳自己。

@(let ([s3 0.18])
   @tamer-figure!['pbl "精选项目制课程主题"]{
 @(para (stone-image "architecture/portfolio/scaffold/big-bang.png" #:scale 0.26) @elem{学生作品主界面})
 @(para (stone-image "architecture/portfolio/scaffold/composition.png" #:scale 0.24) @elem{计算思维第一课(组合与分解)})
  
 @(para (stone-image "architecture/portfolio/scaffold/drunkard.walk.png" #:scale s3) @elem{醉汉漫步})
 @(para (stone-image "architecture/portfolio/scaffold/self.avoiding.walk.png" #:scale s3) @elem{自回避游走})
 @(para (stone-image "architecture/portfolio/scaffold/evolution.png" #:scale s3) @elem{团队项目：演化游戏})})

教研老师和教学老师可以用它创建教学演示程序(@tamer-figure-ref{demo})，甚至教育类应用程序。

@(let ([s3 0.18])
   @tamer-figure!['demo "教学演示程序"]{
 @(para (stone-image "architecture/portfolio/scaffold/radix.png" #:scale s3) @elem{位值制与进制系统})
 @(para (stone-image "architecture/portfolio/scaffold/terminal.png" #:scale s3) @elem{扫描线算法})
 @(para (stone-image "architecture/portfolio/scaffold/stream.png" #:scale s3) @elem{字节流 vs 行缓冲流})})

@handbook-scenario{geofun/tamer: 文档驱动的教学表达系统}

@tt{geofun}是我个人的开源项目，
聚焦于@focus{使用语义化的图形语言来表达逻辑}；
@tt{tamer}整合了@tt{geofun}输出的技术图表，
使其满足出版规范。

特别提醒，@:res{本作品集本身就是它们的产出，
 一定程度上反映了我教材、教案的设计风格}。
当然，真实课堂的学生手册会更偏向学生视角。

@handbook-action{教学建模工具}

@tt{geofun}既可以生成流程图、用例图、活动图等经典软件工程示意图，
它们的形状、线型携带的语义信息符合各自的规范；
也可以生成基于坐标轴的精确几何图形和统计图表。
在此基础之上，我进一步加强了它们的教学表达能力：@handbook-itemlist[
 #:style 'compact
 @item{通过精心设计的@focus{统一配色}降低学生的识图成本、更高效地提取逻辑线索；}
 @item{通过领域描述语言生成更规整、更适合阅读的图表(@fig-ref{prepare.flow}、@algo-ref{scanline})；}
 @item{支持对教学活动(@fig-ref{pbl.uc}、@fig-ref{bullseye.act})和跨学科知识(@fig-ref{chlorophyll.act})的统一建模；}
 @item{支持生成符合数学、物理教材风格的高精度坐标系与函数图像。}]

@handbook-action{函数示意图}

函数是现代理工科最基础的思维工具，
但在传统编程竞赛教学中，
它往往只作为语法知识点出现，
学生很难真正建立函数思维。
我的课程设计深受现代程序语言理论的影响，
@:res{强调函数第一性}，
帮助学生沿着“可见结构 → 可操作结构 → 抽象结构”自顶向下逐步建立认知模型。
因此，课程中会大量使用不同形式的函数示意图。

函数的外部视角多呈现为沙漏形状的输入输出管道(@fig-ref{outfunc})。

@tamer-figure!['outfunc "函数示意图(外部视角)" #:sub-pad (list 0 3.0)]{
 @(para (stone-image "architecture/portfolio/scaffold/sequence-function.png" #:scale 0.36)
        @elem{数列也是函数})
 @(para @(geo-scale (geo-inset timeline.dia (* (geo-height timeline.dia) 0.26) 0.0 0.0 0.0) 0.45)
        @elem{时间轴模型：递推构造逆序列表})
 
 @(para (geo-scale read-line.dia 0.4) @elem{真实数据流经连续的函数管道})}

函数的内部视角多呈现为带输入输出端口的透明白盒(@fig-ref{infunc})。

@tamer-figure!['infunc "函数示意图(内部视角)"]{
 @(para (geo-scale apply.dia 0.45) @elem{高阶函数 apply})
 @(para (geo-scale count.dia 0.45) @elem{高阶函数 count})
 @(para (geo-scale pipeline.dia 0.45) @elem{算法严谨性：缺失的一环})}

@handbook-action{内存快照图}

存储程序思想是基础计算机科学的重要内容，
学生需要直观理解数据在内存中的储存细节。
除实体模拟外，
@tt{geofun}可以抓拍@tt{C++}程序运行时真实的内存快照(@fig-ref*[#:subidx 'b]{memory})。

@tamer-figure!['memory "存储程序思想"]{
 @(para (stone-image "architecture/portfolio/scaffold/simulation.png" #:scale 0.20) @elem{实体内存模型})
 @(para (stone-image "architecture/portfolio/scaffold/ram-variable.png" #:scale 0.3) @elem{内存快照图})}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-reference[]
