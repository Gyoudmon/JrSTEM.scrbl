#lang scribble/base

@(require geofun/vector)

@require{../literacy.rkt}
@require{../../stone/self/logo.rkt}

@require{shell.rkt}

@handbook-root-story{初来乍到，认识命令行 Shell}

@article-desc[#:keywords ["信息技术" "工作目录" "工具使用"]
              #:timestamp "2026-03-13"]

技术的发展往往充满着戏剧性。
AI时代软件行业一顿折腾之后，
竟还是觉得像老一辈计算机科学家和工程师那样通过输入命令来操作计算机的方式最顺手(@tamer-figure-ref{vt100})。
比如，为什么大多数熟练使用计算机的人不能自己安装 OpenClaw 呢？
因为从来没有人跟他们说过本节课的知识。

@tamer-figure!['vt100 "DEC VT100 计算机终端，1978 年"]{
 @(stone-image "home/DEC_VT100_terminal.png" #:scale 0.5)}

@handbook-scenario{Shell: 操作系统的壳}

我们日常能接触的所有能称作计算机的设备——电脑，手机，手表等——
它们都有一个共同点：一个大铁盒子包裹着里面的精密元件，
盒子上至少会配一个屏幕让我们能看到里面正在干嘛。
这个能让我们看到、操作计算机的东西就是操作系统的 @tamer-deftech[#:origin "Shell"]{壳}，
常见的 @tech{shell} 有两种，
一种正是大家都已经很熟悉的@tamer-deftech[#:origin "Graphical User Interface" #:abbr "GUI"]{图形用户界面}，
另一种正是专业人士才会熟悉的@tamer-deftech[#:origin "Command-Line Interface" #:abbr "CLI"]{命令行界面}。

@tamer-figure!['run "运行窗口"]{
 @(stone-image "home/run.png" #:scale 0.5)}

在现代 Windows 系统里，命令行形式的@tech{壳}叫做 @tt{PowerShell}。
启动它最快的方式是：

@tamer-itemlist[
 #:style 'ordered

 @item{用键盘快捷键 @hotkeys['win #\R] 打开@tamer-figure-ref{run}的运行窗口；}
 @item{在窗口里输入 @exec{PowerShell} 就能打开@tamer-figure-ref{ps}的 Windows PowerShell 软件了。
  你可以顺便把它固定在任务栏上。注意，取决于你的 Windows 版本，这个软件可能是黑色，也可能是蓝色。}
 ]

@handbook-scenario{主目录}

@tamer-figure!['ps "Windows PowerShell"]{
 @(stone-image "home/powershell.png" #:scale 0.5)}

于是，本节课第一个有趣的环节来了。
仔细找找看，@tamer-figure-ref{ps}里有没有让你觉得眼熟的东西？

坦白地说，现在的 Windows 文件浏览器过于迁就普通用户了，
以至于地址栏默认不显示当前文件夹的原始路径(@tamer-figure-ref*[#:subidx 'a]{fexplorer})，
用户需要主动点击才行(@tamer-figure-ref*[#:subidx 'b]{fexplorer})。

@tamer-figure!['fexplorer "文件浏览器中的路径"]{
 @(list @(para (stone-image "home/file-explorer.png" #:scale 0.5) @elem{隐藏地址})
        @(para (stone-image "home/file-path.png" #:scale 0.5) @elem{原始地址}))}

然而，一旦文件浏览器里的地址现了原型，
那找到 @tt{PowerShell} 中的眼熟之处就没有悬念了。
两个软件都显示了形如 @filepath{C:\Users\XXX} 的东西。
比如：我的系统里显示的是 @filepath{C:\Users\wargrey}，
你的 @filepath{C:\Users\} 后面一般不会是 @tt{wargrey}。
如果是的话，那我俩一定有着特别的缘分，
因为我们起了相同的@bold{英文名}。

换句话说，无论是通过图形界面登录系统，
还是通过 @tech{shell} 命令行登录系统，
你都会进入系统为你准备的用户目录里，
我们把这个目录叫做@tamer-deftech[#:origin "Home Directory"]{主目录}。
言下之意，这个目录有着特殊意义，
它是你在“此电脑”里的“个人房间”。

@handbook-scenario{文件路径记号}

接下来，请同学对照@tamer-figure-ref{fexplorer}进入自己的@tech{主目录}，
操作顺序是依次打开“此电脑”、“C盘”、“用户”、“你的用户名”。

我猜，你没发现哪里不对劲。
但你细品，我们说了很多中文文件夹，
别的国家的人要怎么进入自己的@tech{主目录}呢？
@tamer-figure-ref{enfile}是英文版计算机的界面，
它表明不同国家的人在文件浏览器里看到的东西确实不尽相同，
但又都共同指向自己的@tech{主目录}。

@tamer-figure!['enfile "英文版文件浏览器"]{
 @(stone-image "home/file-en.png" #:scale 0.5)}

由此，我们可以大胆地归纳，
形如 @filepath{C:\Users\wargrey}的由一串文字和符号构成的@tamer-deftech[#:origin "Path"]{路径}才是唯一没有歧义的描述文件和文件夹位置的方式。
具体来说：

@tamer-itemlist[
 #:style 'compact

 @item{“C盘”是中文说法，它实际写作“C:”。计算机只认@litchar{字母}和后面的@litchar{:}。}
 @item{不同层级的文件夹之间用 @litchar{\} 或 @litchar{/} 分隔。}
 ]

总之，在计算机眼里，@focus{标点符号比文字还重要}。
文字其实是为了让人能看懂才写的，
两个AI交流完全可以不用任何人类的文字。

@handbook-scenario{命令行}

好的，有了这些信息技术常识，我们终于可以开始做一件更有趣的事了：
让 @tt{PowerShell} 也能像文件浏览器一样列出文件夹里的内容。
注意，如果你的 @tt{PowerShell} 软件里看不到那个一闪一闪的光标，
先用鼠标点一下。嗯，这个一闪一闪的光标就是在说，
“主人，我已准备就绪，您开始下命令吧”。
现在，请输入 @exec{ls} 两个字母。

@centered{@geo-dsfit[@spearator 400 0]}

好了没？咦，貌似什么也没发生。
这就对了，当我们说“给计算机下达命令”时，
命令几乎不会只有单个字母。
那么问题来了，
计算机怎么知道你已经输入完了呢？
你得给它一个明确的信号才行，
这个信号就是“按下 @hotkeys['Enter] 键”。

于是，按下 @hotkeys['Enter] 键之后你就能看到@tamer-figure-ref{ls}了。
不过不要直接跟它对比，你看看你得到的输出跟你文件浏览器里的目录是不是相似？
之所以是相似而非相同，
是因为像“Documents”这样的特殊文件夹在文件浏览器里会汉化成“文档”，
而 @exec{ls} 默认不显示隐藏文件。

@tamer-figure!['ls "ls 命令"]{
 @(stone-image "home/ls.png" #:scale 0.5)}

这也就是@tamer-deftech[#:origin "Command Line"]{命令行}这个名字的由来:
你输入的@emph{命令}以@emph{换行}结尾，计算机执行你的命令，
然后告诉你结果，并且很贴心地@emph{等待}你的下一条命令。

@handbook-scenario[#:tag "$shell:file_cmd"]{准备学习环境}

有了以上知识，本节课剩下的时间是纯操作性实践，
详细流程参考@tamer-figure-ref{setup.dia}。
注意，无论你自己操作，还是找家长协助，
@:err{务必不要更改软件的安装目录}。

@tamer-figure!['setup.dia @list{准备学习环境@~ 流程图}]{@geo-vector[@setup.dia]}

建议在练习 @exec{mkdir} 命令时分屏显示 PowerShell 和文件浏览器，
这样你有机会见证奇迹时刻，
从而更直观地理解@focus{两种操作计算机的方式效果相同}。

@handbook-scenario{教师导读}

本课作为我的课程体系的第一节课，
学生通常是个完全的新手，
因此@emph{不适合}以项目制形式展开。
但是可以从本节课开始@bold{培养学生对@emph{符号}的观察能力}，
为后续的进阶学习和综合课程打基础。

带学生准备课程项目目录的过程会比较漫长，但是氛围很好。
新的班级，
学生对键盘的熟练度、对知识的理解肯定有差异，
学生与学生之间就有机会互相了解、建立初步的合作。

据我观察，比起写那个无聊的“@litchar{Hello, World!}”，
这种充满极客精神的操作性课程最能激活课堂氛围，
孩子们课后也可以直接演示给家长看。

@handbook-scenario{课后探索}

@handbook-action{常规练习}

以下几个最常用的文件操作命令，
你需联系“个人房间”比喻勤加练习以达到与系统的流畅对话。
记住，今后你写的每一个程序都是自己的宝贵资产，
它们值得被妥善安置在你自己的数字空间里。

@(define make-shell-row
   (lambda [shell arglist semantics helper]
     (define cmd (symbol->string shell))
     (define args (map smaller arglist))

     (list @commandline[(add-between (cons (exec cmd) args) @hspace[1])]
           @smaller[semantics]
           @list[helper])))

@tamer-table!['psfile "本阶段学生需要熟练掌握的文件操作命令"]{
 @(list           @commandline{@emph{命令}}   @emph{语义}              @emph{助记单词})
 @(make-shell-row 'cd        '("目录路径")    "切换“当前工作目录”的路径"  @tt{@litchar{c}hange @litchar{d}irectory})
 @(make-shell-row 'ls        '("[目录路径]")  "列出目录的内容"           @tt{@litchar{l}i@litchar{s}t directory contents})
 @(make-shell-row 'mkdir     '("目录路径")    "在指定路径创建目录"        @tt{@litchar{m}a@litchar{k}e @litchar{dir}ectory})
 @(make-shell-row 'pwd       '()             "打印“当前工作目录”的路径"  @tt{@litchar{p}rint @litchar{w}orking @litchar{d}irectory})}

你也可以借助词典软件、搜索引擎理解@tamer-table-ref{psfile}中的助记单词，
它们是 @tech{shell} 命令的来源，
理解了那些单词就不再需要背诵命令了。

@handbook-action{扩展思考}

@handbook-itemlist[
 #:style 'ordered

 @item{为什么 shell 命令不直接使用完整的英文单词，而是弄一堆令人费解的缩写？请结合你的练习体验思考。}
 
 @item{本课所学的操作流程是不是有点熟悉？跟AI聊天貌似也是这个过程吧？请思考它们的相似和不同。}
 ]

@handbook-reference[]
