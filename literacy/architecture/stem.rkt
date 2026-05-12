#lang typed/racket/base

(provide (all-defined-out))

(require diafun/activity)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define captions
  #hasheq((Observe . "观察生活与自然现象")
          (Curiosity  . "提问：树叶缘何变绿、变黄？")
          (Hypothesis . "猜测：树叶含有不同色素")
          (Watch . "观看科普视频")
          (Expression . "表述色素与叶色的关系")
          (Prepare . "明确实验目的与操作")
          (Step1 . "实验一：提取叶绿素")
          (Step2 . "实验二：层析分离色素")
          (#::Filtrate . "叶绿素滤液")
          (#::Chromatogram . "层析滤纸")
          (Analyze . "分析误差来源\n菠菜、操作如何影响结果")
          (Experience . "感受科学家的日常\n实验结果未必符合预期")
          (Assembly . "科学背包归档\n(带回家交流延伸")
          (Sumup . "项目总结\n重新理解最初的好奇")
          (Colloid . "对比实验\n叶绿素滤液 vs 绿色水溶液")

          (Change . "苏教版六年级科学教学\n第一单元：《物质的变化》")
          (Extract . "收尾小节教学\n第三节：《化学家的研究》")
          
          (Prepare6 . "简单提及树叶的颜色\n明确实验目的与操作")
          (Grinding+Filter . "研磨、过滤叶绿素")
          (#::Filtrate6 . "叶绿素滤液")
          (#::Chromatogram6 . "层析滤纸")
          (Chromatography . "观察层析法分离光合色素")
          (Experience6 . "感受化学家的研究")
          (Cleanup . "实验善后处理")
          (Light . "留给五年级做光学实验")

          (#:/doc/docx . "实验报告")
          (#:/doc/pptx . "课件\n@架构师的跨学科课堂")
          
          (Spread . "小实验：纸吸水观察墨汁扩散")
          (Rote . "困惑中死记硬背化学家的工作内容")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-activity-diagram! chlorophyll.act
  #:let ([pin-stroke (desc-stroke #:color 'Teal #:width 2.0)]
         [material-pin (geo-inset (geo-square 8 #:stroke pin-stroke) 2.0)])
  [#:block-desc captions #:frame 'White] #:-
  (move-down 0.8 'Observe)

  [#:tree (move-down 1 '?)
   [=> (move-left 2 'cancel~$ "[无想法]")]
   [=> (move-down 1.3 'Curiosity "[好奇]")

       [#:tree (move-down 1 'freshmen?)
        [=> (move-left 1 #false "[研磨过花青素]")
            (move-down 0.75 'Hypothesis)
            (move-down 0.75 )
            (move-right 1 '+watch-)]
        [=> (move-down '+watch- #false "[无基础]")]]

       (jump-to '+watch-)
       (move-down 1 'Watch)
       (move-down 1 'Expression)
       (move-down 1 'Prepare)
       
       [#:tree (move-down 1 'Step1)
        [=> (move-left 3.25 #false '#:write)
            (move-down 2.75 '#:/doc/docx)]
        [=> (move-down 1 '#::Filtrate)
            
            [#:tree (move-down 0.75 '--=)
             [=> (move-left)
                 [#:tree (move-down '#:/doc/docx 'Step2 material-pin)
                  [=> (move-to '#:/doc/docx '#:write)]
                  [=> [#:tree (move-left-down 0.5 1 'obvious?)
                       [=> (move-down 2.5 '+sumup- "[色带明显{P < 0.1}]")
                           (move-down 1 'Sumup)
                           (move-down 1 'Assembly)]
                       [=> (move-left 1 #false "[色带不明显{P > 0.9}]")
                           (move-down 0.75 'Analyze)
                           (move-down 1 'Experience)
                           (L-step '+sumup-)]]]
                  [=> [#:tree (move-right-down 0.5 1 '#::Chromatogram)
                       [=> (move-to 'obvious? '#:read)]
                       [=> (move-downwards 'Assembly)
                           (turn-down-left)
                           (move-to 'Assembly)]]]]]
             [=> (L-step 'Assembly material-pin)]
             [=> (move-right 0.75)
                 (move-down 'Step2 'Colloid material-pin)
                 (move-down 2)
                 (move-right 1 '#:/试剂架)]]]]]]

  [#:tree (jump-to '#:/doc/docx)
   [=> (L-step 'Sumup #false '#:read)]
   [=> (shuffle-left 3.0)
       (L-step 'Assembly)
       (move-down 0.8 '$)]]

  (jump-to 4 '^6)
  (move-down 0.75 'Change)
  (move-down 1 'Extract)

  [#:tree (move-down 1 'std?)
   [=> (move-left 0.75 #false "[有趣且有用]")
       (move-down 1 'Prepare6)
       (move-down 1 'Grinding+Filter)
       (move-down 1 '#::Filtrate6)

       [#:tree (move-down 1 'Chromatography material-pin)
             [=> (move-left-down 0.75 1 'Experience6)
                 (move-down 1 'Cleanup)
                 (move-down 0.8 '6$)]
             [=> (move-right-down 0.75 1 '#::Chromatogram6)
                 (L-step 'Cleanup)]]]
   [=> (move-right 0.75 #false "[标准流程]")
       (move-down 1 'Spread)
       (move-down 1 'Rote)
       (move-down 0.8 '6~$)]]
  
  (jump-to 1.75)
  [#:tree (jump-down 'Prepare6 '#:/doc/pptx)
   [=> (move-to 'Prepare6 '#:read)]
   [=> (shuffle-left 4)
       (L-step 'Watch #false '#:read)]
   [=> (shuffle-left 2)
       (L-step 'Prepare #false '#:read)]]
  
  (jump-up '#:home)
  (move-down '$))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ main
  chlorophyll.act)
