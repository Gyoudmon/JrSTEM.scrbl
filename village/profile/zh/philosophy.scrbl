#lang scribble/manual

@require{../../../literacy/zh.rkt}

@require{philosophy.rkt}

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-root-story{教育理念与课程体系}

优秀的学生随便怎么教可能都不会差，
但用更符合直觉的方式入门和成长能让所有学生受益。
因此，在孩子学习的早期阶段，
我们有必要摈弃过于功利的竞技因素，
转而构建正确的心智模型。
于计算机科学教育，这个心智模型可以是：
@focus{编程是一种写作活动，写作的目的是驱动计算机干活}。
将来等孩子们接触数学证明之后，他们还会进一步发现：
@:result{写作、编程和数学证明其实是一回事}。
因为@focus{编程写的是逻辑，逻辑可以用大白话表述，也可以用数学语言表述}。

@handbook-scenario[#:tag "plt-entries"]{“函数”第一性的多路径入门策略}

为使课程真正意义上符合孩子的心智特点，
在过去几年的教学实践中，
我的课程经历过多次从底层逻辑开始的重构。
@tamer-figure-ref{prepare.flow} 是第一阶段流程图，
其最显著的设计是真正落地了@focus{@emph{跨学科实践}}。

@tamer-figure!['prepare.flow @list{序章主题课流程}
               @geo-vector[@prepare.flow]]

我们的课程始于 Shell 指令实验(@tamer-figure-ref*[#:subidx 'a]{lives})：
通过输入几个单词让此电脑里多出一个文件夹。
多数孩子都很享受这种“输入即反馈”的震撼，好似初次观摩酷炫的化学反应。
这个过程顺便就学到了必要的信息技术常识、建立自己的工作目录、使用 git 同步课程资料库等。

@(let ([s 0.53])
   @tamer-figure!['lives "课堂实况照片"]{
 @(para (stone-image "architecture/shell.png" #:scale s) @elem{二年级孩子认识 Shell})
 @(para (stone-image "architecture/portfolio/python.png" #:scale s) @elem{三年级 Python 社团课})
  
 @(para (stone-image "architecture/hookes.png" #:scale s) @elem{六年级孩子合作探索胡克定律})
 @(para (stone-image "architecture/game.of.life.png" #:scale s) @elem{七年级女孩体验“生命游戏”})})

@:res{Shell 最重要的启蒙价值是引出那个我们称为@emph{函数}的概念}，
之后学生可以根据自己的实际情况选择不同的入门路线，
将来在合适的时候再殊途同归。

小学段的跨学科主题课强调立足学生已有知识，
@focus{通过对比自然语言、数学记号、伪代码、程序代码来引导学生关注同一概念的不同表达方式，
 在文法和符号层面帮助学生建立知识网络}。

@handbook-scenario[]{项目制编程课教学框架}

教学目标以@focus{计算思维}为导向，课程内容原则上与语言无关。
实际教学中，@tt{C++}是主要授课语言，为学生冲刺信息学奥赛铺路；
有特别需求的学生才用@tt{Python}过渡(@tamer-figure-ref*[#:subidx 'b]{lives})。

@tamer-figure!['pbl.uc @list{项目制编程课用例图} @geo-vector[@pbl.uc]]

教学实施中的关键角色和任务见@tamer-figure-ref{pbl.uc}的@bold{用例图}。
多个角色可能由同一个人扮演。
@focus{认知负荷管理是重中之重}，通过裁剪项目来完成。
教研老师和授课老师需要共同给知识网分级，
哪些知识需要重点掌握、哪些能力需要长期引导、
哪些代码可以复制粘贴、哪些适合练习与搜索引擎和AI的互操作。

小学生的认知能力也值得尊重，
@:err{切勿用“幼态词汇”包装硬核知识、用“假装有趣”替代清晰表述}。
这不仅不能帮助学生理解问题，还是在为进阶学习制造阻力。
当然，我们也必须承认，学生的年龄和认知发展规律是客观存在的限制。
@:res{如果学生确实年纪小学不了太深奥的内容，
那应该减少单次课程的知识密度放慢节奏，
而不是用不合适的类比强行灌输}。

家长一般不直接参与，但应该表现出重视，
偶尔跟孩子聊聊课上学了啥，
这对于兴趣和内驱力尚未表现出来的孩子极为重要。

@handbook-scenario{学生能力评估表}

考试/比赛成绩是学生和家长比较熟悉的能力评估方法。
但弱化了考试和比赛环境之后，
我们还有一套以综合素养为中心的评估方法，
特别适用于6人小班制教学场景。

@tamer-table!['evaluate "学生素养评估表(10分制)"]{
 @tabular[
 #:pad (list 2.0 0.0)
 #:cell-properties (list (list '(border center) '(border left) '(border center)))
 (list (list @bold{能力维度}  @bold{@hspace[25]能力指标@hspace[25]} @bold{评分})
       (list @elem{知识迁移}  @tabular[(list
                                    (list @elem{1.能够将已学知识完整表述出来（概念，术语，原理）})
                                    (list @elem{2.能够建立所学知识与生活的联系（类比，相似、差异）})
                                    (list @elem{3.能够建立所学知识与其他学科的联系})
                                    (list @elem{4.能够举例说明所学知识在真实世界的应用案例（工具,作用）}))] null)
       (list @elem{语言表达}  @tabular[(list
                                    (list @elem{1.交流、对答时不怯场，语言流畅、准确})
                                    (list @elem{2.能够灵活切换关键词、短句、长句等多种表达等级})
                                    (list @elem{3.能够等价使用文字、图表、符号、代码等多种表达方式})
                                    (list @elem{4.课中、课后能够将以上内容整理成笔记、文档}))] null)
       (list @elem{逻辑思维}  @tabular[(list
                                    (list @elem{1.能够对正在探究的问题设计健壮的测试用例})
                                    (list @elem{2.能够对自己程序的输出结果和测评结果提出反向猜想})
                                    (list @elem{3.讨论问题时，对自己提出的重要假设要能做出合理的预判})
                                    (list @elem{4.能够从已有知识中发现规律，并推导出新知识})
                                    (list @elem{5.接触新知识时，能够想象其应用场景、实施细节}))] null)
       (list @elem{批判性思维}  @tabular[(list
                                    (list @elem{1.表明观点或主张时，能同时提供证据})
                                    (list @elem{2.遭到质疑时敢于自我核查与校正；如果确定自己靠谱则保持自信})
                                    (list @elem{3.对于自认确定的结果，能够再从其他角度多问几个为什么})
                                    (list @elem{4.当其他同学意见不同时，能够尝试理解他们而不产生偏见})
                                    (list @elem{5.学到新知识后，能够回过头来重新认识已学知识，建立知识网}))] null)
       (list @elem{项目能力}  @tabular[(list
                                    (list @elem{1.操作性任务能够熟练使用命令行、快捷键、测试工具节省时间})
                                    (list @elem{2.能够将复杂问题拆解成一个个小问题各个突破})
                                    (list @elem{3.编码中碰到问题时能够灵活使用多种调试手段解决问题})
                                    (list @elem{4.相同问题相较其他同学能够更好地平衡理论的优美和工程的健壮}))] null)
       (list @elem{专注力}  @tabular[(list
                                   (list @elem{1.较少无目的地乱敲键盘、乱涂乱画、操作课堂无关软件})
                                   (list @elem{2.有目的地纸笔推演、操作软件、借助手边工具做实验})
                                   (list @elem{3.沉浸于问题的发现、推理、试错、解决，不受外界干扰})
                                   (list @elem{4.对简单问题能够迅速作答、有问题能及时提问}))] null))]}

详细评估维度见@tamer-table-ref{evaluate}。
在真实的教学实践中，
每节课由主教老师或助教老师根据当次课的实际情况给每一位孩子打分。
打分不参考过往得分，但按期汇总，并绘制孩子的能力成长曲线和雷达图。
孩子的成长轨迹远比得分有价值。

@;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
@handbook-reference[]
