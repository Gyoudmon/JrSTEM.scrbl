#lang scribble/manual

@require{../../../literacy/zh.rkt}

@require{plt.rkt}
@require{bullseye.rkt}

@(require geofun/vector)

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-root-story{计算机科学教学案例}

@handbook-scenario[]{跨学科项目制课程《三原色打靶游戏》}

@tabular[
 #:pad (list 1 0)
 #:style 'boxed
 (list (list @bold{问题} @list{学生从 @tt{Scratch} 转向 @tt{C++} 竞赛训练，学习兴趣显著下降})
       (list @bold{设计} @list{对齐学生已有知识，引入过渡层，帮助学生校准编程在学校教育知识网中的位置})
       (list @bold{实施} @list{通过项目驱动任务和自研教学引擎，逐步建立抽象能力与问题建模能力})
       (list @bold{结果} @list{在小规模教学实践中能显著提升学习持续性，降低路径切换带来的流失风险}))
 ]

@tamer-figure!['bullseye "五年级男生把玩自己的 C++《三原色打靶游戏》"]{@(stone-image "architecture/bullseye.png")}

@tamer-figure-ref{bullseye}中的男生五年级，
有一年 @tt{Scratch}/@tt{pygame} 网课经验，
在班里数一数二，但拒绝参加比赛。
从抗拒文本编程到寒假能花 @tt{3h + 3h} 独立完成该项目仅16次课，
最终代码量150--200行。

@tamer-figure=['bullseye.act @list{《三原色打靶游戏》教学实施@~ 活动图}]{@geo-vector[@bullseye.act]}

@tamer-figure-ref{bullseye.act}展示了本项目详细完整的教学流程。
我的职能是帮学生规划好五到六个递进的小目标，
重点是给他看清楚每个小目标应该达成的效果，
然后他自己就知道要干嘛了。

@handbook-action{给游戏中的物体起名}

学生做完了准备工作之后首先要认真思考的问题是“定义游戏中的‘物体’”，
即，给物体起名。
每个孩子都会在长辈的引导下认识身边的物体，
这一次，孩子自己是老师，被教的是计算机。
这个过程可以得到@algo-ref{defobjects}，
定义物体对应的变量及其到标准 @tt{C++} 的翻译：

@algo-pseudocode[
 #:tag 'defobjects "定义新世界中的“物体”"
 @list['企鹅英雄]{@(elem @:type{Tuxmon}@:operator{*}@~ @:variable{hero}@:meta{;})}
 @list['长方形平台]{@(elem @:type{Rectanglet}@:operator{*}@~ @:variable{platform}@:meta{;})}
 @list['长方形传送带]{@(elem @:type{Rectanglet}@:operator{*}@~ @:variable{conveyor}@:meta{;})}
 @list['长方形靶子]{@(elem @:type{Rectanglet}@:operator{*}@~ @:variable{bullseye}@:meta{;})}
 @list['圆形子弹]{@(elem @:type{Circlet}@:operator{*}@~ @:variable{bullet}@:meta{;})}
 ]

@handbook-action{用代码表达物理模型}

相对于给物体起名，给概念起名要抽象很多。
五年级学生已经在数学或科学课上学过运动和速度，
知道速度可以用@:type{小数}量化。
于是@algo-ref{defconstants}定义物理常量的本质即是给各种速度起名字：

@algo-pseudocode[
 #:tag 'defconstants "定义和微调物理常量"
 @list['定义英雄速度值]{@(elem @:type{double}@~ @:variable{hero_speed}@~ @:pn{=}@~ @:number{3.0}@:meta{;})}
 @list['定义子弹速度值]{@(elem @:type{double}@~ @:variable{bullet_speed}@~ @:pn{=}@~ @:number{10.0}@:meta{;})}
 @list['定义重力加速度值]{@(elem @:type{double}@~ @:variable{gravity_acceleration}@~ @:pn{=}@~ @:number{0.1}@:meta{;})}
 ]

@:variable{重力加速度}对小学生而言是个很有挑战性的概念，但理解它却意外地简单。
加速度和速度都是矢量，同时具备大小和方向两个维度，
学生完全可以用同一个思路来直观感受。像这样：

@algo-pseudocode[
 #:tag 'jump "英雄跳跃"
 @list['英雄受平台反作用力]{@(elem @:variable{hero}@:pn{->}@:method{set_velocity}@:pn{(}@:variable{hero_speed}@:pn{,}@~ @:number{-90.0}@:pn{)}@:meta{;})}
 @list['英雄受重力]{@(elem @:variable{hero}@:pn{->}@:method{set_acceleration}@:pn{(}@:variable{gravity_acceleration}@:pn{,}@~ @:number{90.0}@:pn{)}@:meta{;})}
 ]

科学课已经让学生认识了力与运动，
本项目则给予学生机会探索运动的正交分解。
英雄的朝向和运动状态也会影响子弹的发射方向，
这是学生探索过程中最乐此不疲的点。
总之，本例涉及到的物理知识都在小学生能理解或能体验的范围内，
继而教会计算机怎样的速度控制才顺手。

@handbook-action{用代码表达数学模型}

三原色是小学生耳熟能详的热门知识，
但鲜少有人知道，它能串联起多个小学生就能理解的数学模型。
一方面，位值制是自然数运算中最重要的思想，
它理应是每个小学生都要认真理解的概念；
一方面，编程教育天生避不开进制换算，
但传统教法往往过于着急地让学生背公式，
而不注重位值思想对进阶学习的启迪价值——它其实是多项式概念最朴素、最直观的入门载体。
因此，@:res{展开式是我的教学重点}。
很多整数相关问题，其本质都是在跟这些展开式打交道——换一个底数、作一些算术运算。

@tamer-figure-ref{rgb}展示了从位值制展开式到RGB色彩空间的可行教学路径：
二进制数数 → 二进制展开式 → 十六进制展开式 → 256进制展开式
→ @focus{设计}RGB色彩空间表示法 → @focus{设计}运算法则。
即，当一个位置上的数字数完了但不发生进位会发生什么?

@tamer-figure!['rgb @list{位值制的扩展与应用@~ 学生手册}]{@(stone-image "architecture/positional.png" #:scale 0.5)}

从游戏功能角度来讲，子弹颜色由三个开关控制，玩家自行判断何时打开或关闭。
于是，现在我们可以很方便地实现“子弹变色”功能了：

@algo-pseudocode[
 #:tag 'bullet_color @list{实现“子弹变色”功能}
 @list['红色分量值]{@(elem @:type{RGBA}@~ @:variable{r}@~ @:pn{=}@~ @:val{this}@:pn{->}@:variable{r_value}@:meta{;}@~
                         @:comment{// @${0xFF0000} or @${0}})}
 @list['绿色分量值]{@(elem @:type{RGBA}@~ @:variable{g}@~ @:pn{=}@~ @:val{this}@:pn{->}@:variable{g_value}@:meta{;}@~
                         @:comment{// @${0x00FF00} or @${0}})}
 @list['蓝色分量值]{@(elem @:type{RGBA}@~ @:variable{b}@~ @:pn{=}@~ @:val{this}@:pn{->}@:variable{b_value}@:meta{;}@~
                         @:comment{// @${0x0000FF} or @${0}})}
 @list['加色混合]{@(elem @:type{RGBA}@~ @:variable{color}@~ @:pn{=}@~ @:variable{r}@~ @:pn{+}@~ @:variable{g}@~ @:pn{+}@~ @:variable{b}@:meta{;})}
 ]

@algo-ref{bullet_color}直接使用@tt{C++}的@emph{操作符重载}机制来完成子弹颜色的动态计算思路，
但这件事并没有看上去的那么不可思议。
我们只是借此机会点明@emph{运算符也是函数}，
自定义运算符就是在定义函数。

@handbook-action{用代码表达游戏逻辑}

坐标相当抽象，在正常的理科学习中，
学生从理解坐标到主动建立坐标系解决问题，
往往需要数年时间。
因此，本着@:res{从学生直觉出发，培养底层思维}原则，
在本项目中我们有意避开了坐标概念，
转而用大白话来描述游戏物体的运动，
把对坐标方法的训练留到其他主题课中。

@algo-pseudocode[
 #:tag 'shot "英雄射击"
 @list['子弹受推力]{@(elem @:variable{bullet}@:pn{->}@:method{set_velocity}@:pn{(}@:variable{bullet_speed}@:pn{,}@~ @:variable{hero}@:pn{->}@:method{get_heading}@:pn{())}@:meta{;})}
 @list['子弹受重力]{@(elem @:variable{bullet}@:pn{->}@:method{set_acceleration}@:pn{(}@:variable{gravity_acceleration}@:pn{,}@~ @:number{90.0}@:pn{)}@:meta{;})}
 ]

以@algo-ref[#:line '子弹受推力]{shot}为例，
解读它们含义的过程就是语文和英语课上的“连词成句”练习：
@:desc{沿着英雄的朝向将子弹的速度设置为(上面定义的)子弹速度值}：
@centered{
 @(let ([enfont (desc-font #:family 'serif)]
        [cnfont (desc-font #:size 'x-small)])
    (geo-hc-append* #:gapsize 16.0
                    (for/list ([en (in-list '(bullet set velocity speed hero get heading))]
                               [cn (in-list '(子弹   设置  速度     速度值 英雄 获取 朝向))])
                      (geo-vc-append #:gapsize 4.0
                                     (geo-text en enfont #:color 'Black)
                                     (geo-text (format "(~a)" cn) cnfont #:color 'DimGray)))))}
相应地，写这行代码的过程就是在做“缩句”。
于是，碰撞检测就自然归结为了一条提问：
@centered{@(elem @:method{is_colliding}@:pn{(}@:variable{hero}@:pn{,}@~ @:variable{platform}@:pn{);})}

到这里，学生已经有了“描述游戏核心功能”的全部词汇，剩下的就是花点耐心“组织好语言”。

@handbook-action{结语}

本例围绕三条互相渗透的硬核路线展开：
@tamer-itemlist[
 #:style 'compact
 @item{@bold{数学}：基于位值思想设计出 RGB 色彩空间，赋予其截断加法运算动态计算子弹颜色；}
 @item{@bold{物理}：基于直观矢量模型将运动学知识转化为小学生能理解的描述，控制英雄和子弹的运动；}
 @item{@bold{语言}：以“命名”和“写作”两个基本思路将数学模型和物理模型组织成程序结构。}
 ]

整个过程中，我不刻意给学生看我写的代码，
但学生可以参考@focus{自己以前的练习和作品}。
最终，该生的评价是“我的系统和 Scratch 都有趣”，
这表明这种从直觉出发的入门策略确实有助于学生以较低认知负荷进入高劝退语言。

此外，
@bold{教学活动围绕教学目标展开，无关细节（如深刻理解类的定义/运算符重载）暂不深究}。
@:err{切勿想着学生必须先理解完每一行代码才能开始自己动手
 }——这是编程教育中最典型却也是最常见的低效教法。

@handbook-scenario[]{基于数学建模的 CSP/J 竞赛摸底测试}

@tabular[
 #:pad (list 1 0)
 #:style 'boxed
 (list (list @bold{问题} @list{传统语法驱动路径导致初学者抓不住重点、成长极其缓慢})
       (list @bold{设计} @list{在学习早期就按照“可见结构 → 可操作结构 → 抽象结构”认知路径培养数学建模意识})
       (list @bold{实施} @list{通过精心设计的学生手册引导学生纸笔推演，最终将推演过程翻译成题解代码})
       (list @bold{结果} @list{学生从依赖背模版逐步过渡到独立完成建模任务}))
 ]

@tamer-figure!['csp "跨学段 CSP/J 班，初见"]{@(stone-image "architecture/CSP-J.png")}

我接手过别的老师的初中CSP/J班，七年级入门班(@tamer-figure-ref{csp})和八年级进阶班。
我挑选的摸底测试题是“终端里的字符画”，
全部十个初中生(外加两个小学高年级学生)，尽显传统教法的众生百态。
唯一能独立完成题解的是个八年级学生，早早提交后开始摸鱼；
其他同学的屏幕表明他们之前很重视“肌肉记忆训练”，都嵌套到三层乃至四层了。
问题是，在常规教学中，它是经典循环练习题，
学生练完就@bold{光剩肌肉记忆了，反射不出正确的终止条件啊}。

@handbook-action{用纸和笔推演数学模型}

在以数学为代表的理科教育中，
提升思维的教学往往伴随着对学生已经形成的定式的解构，
这是我选字符画题型作为此次摸底的深层原因——它有可见结构，
且可以很自然的转化成两个可操作结构：
轮廓跨度(@fig-ref*[#:subidx 'a]{term-pptx})和起点位置(@fig-ref*[#:subidx 'b]{term-pptx})。

@tamer-figure!['term-pptx @list{终端字符画中的数学模型@~ 课件}]{
 @(let ([s 0.26])
    (list @(para (stone-image "architecture/portfolio/term-span.png" #:scale s) @elem{轮廓跨度})
          @(para (stone-image "architecture/portfolio/term-pos.png" #:scale s) @elem{起点位置})))}

@handbook-action{用代码表达数学模型}

得到数学模型之后，
我们会按照计算思维的一般思路把可操作结构转为代码，
策略依旧是@focus{自顶向下设计、自底向上构建}。

@algo-pseudocode[
 #:side (geo-scale ASCII-Art.dia 0.24)
 #:side-offset '-36pt
 #:tag 'scanline @list{用@tt{C++}描述“扫描线算法”}
 @list[@${pos(n, L) = n - L + 1}]{@(elem @:type{int}@~ @:function{pos}@:operator{(}@:type{int}@~ @:variable{n}@:meta[","]@~ @:type{int}@~ @:variable{L}@:operator[") { "]
                                         @:keyword{return}@~ @:variable{n}@~ @:operator{-}@~ @:variable{L}@~ @:operator{+}@~ @:number{1}@:meta{;}@~ @:operator["}"])}
 @list[@${span(L) = 2L - 1}]{@(elem @:type{int}@~ @:function{span}@:operator{(}@:type{int}@~ @:variable{L}@:operator[") { "]
                                    @:keyword{return}@~ @:number{2}@~ @:operator{*}@~ @:variable{L}@~ @:operator{-}@~ @:number{1}@:meta{;}@~ @:operator["}"])}
 @list['定义桩函数]{@(elem @:type{void}@~ @:function{display_line}@:operator{(}@:type{int}@~ @:variable{n}@:meta[","]@~ @:type{int}@~ @:variable{L}@:operator[") { }"])}
 @list[]
 @list[#false]{@(elem @:type{int}@~ @:function{main}@:operator{(}@:type{int}@:meta[","]@~ @:type{char}@:operator["**) {"])}
 @list['金字塔整数层高]{@(elem @hspace[4]@:type{int}@~ @:variable{n}@:meta{;})}
 @list['读取层高]{@(elem @hspace[4]@:keyword{std}@:operator{::}@:sym{cin}@~ @:operator{>>}@~ @:variable{n}@:meta{;})}
 @list[]
 @list['对于1至n的每一行L]{@(elem @hspace[4]@:keyword{for}@~ @:operator{(}@:type{int}@~ @:variable{L}@~ @:operator{=}@~ @:number{1}@:meta{;}@~
                       @:variable{L}@~ @:operator{<=}@~ @:variable{n}@:meta{;}@~
                       @:variable{L}@~ @:operator{++)}@~ @:operator["{"])}
 @list['输出该行字符]{@(elem @hspace[8]@:function{display_line}@:operator{(}@:variable{n}@:meta{,}@~ @:variable{L}@:operator{)}@:meta{;})}
 @list[#false]{@(elem @hspace[4]@:operator["}"])}
 @list[#false]{@(elem @:operator["}"])}
 ]

@algo-ref{scanline}得到的就是终端字符画题型的典型结构——源自计算机图形学中@emph{填充封闭图形}的扫描线算法。
在此阶段，学生需要认真体会@focus{可读性高的代码如何忠实地反映数学模型}，
以及@focus{该结构如何方便地迁移到绘制其他字符画的场景}，
而不是被迫在层层嵌套的低级循环语法里迷失。

@algo-ref[#:line '定义桩函数]{scanline}定义了一个名为 @:function{display_line} 的桩函数，
其功能是@emph{在位置@${pos(n, L)}处显示@${span(n)}个字符}，
展开后的详细流程见活动右侧流程图。
在此活动中，它充当运行程序的桩，尚未正式实现。
在后续活动中，它可以就是传统教法中的嵌套循环，
也可以是其他更省力的做法(如字符串类型的加法和乘法运算)，不在此赘述。

@handbook-action{结语}

本例唯一的硬性要求是，@focus{学生必须认真用纸和笔完成学生手册}。
学生也都很配合，
尤其那位能独立用传统方法解题的八年级学生，
对建模驱动的思路表现出了更明显的兴趣。

同时，本例也反映了明显的年龄梯度。
小学高年级学生能听懂，但下课就忘；
七年级学生跟着老师在纸上推演能掌握精髓；
八年级学生能仅靠阅读提问自己总结出模型。
小学生的困难，并非源于建模本身，
而是抽象认知能力尚不稳定，
以及其他学科(包括奥数课和传统教法的编程课)没跟上，
学生课后缺乏直接的刻意练习场景。

因此，@:res{以数学建模为主线的教学路径常被误解为难度高，实际是对认知阶段更敏感}。
我提倡在尊重学生智力发展水平的前提下，
从课程早期就合理选题，
严格遵守“可见结构 → 可操作结构 → 抽象结构”认知路径。
学生一旦适应，后续学习将呈现出明显的加速效应。

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-reference[]
