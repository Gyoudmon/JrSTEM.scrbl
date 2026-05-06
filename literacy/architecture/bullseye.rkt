#lang typed/racket/base

(provide (all-defined-out))

(require diafun/activity)
(require diafun/usecase)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define ts:pin (desc-stroke #:color 'DeepSkyBlue #:width 1.5))
(define ss:pin (desc-stroke #:color 'DarkTurquoise #:width 1.5))

(define actor-colorize : UC-Block-Theme-Adjuster
  (lambda [style id stereotype]
    (case id
      [(#:me) (remake-dia-block-style style #:fill-paint (pen-color ts:pin))]
      [(#:he) (remake-dia-block-style style #:fill-paint (pen-color ss:pin))])))

(define act-adjust : Act-Block-Theme-Adjuster
  (lambda [style id stereotype]
    (case stereotype
      [(#:screen) (remake-dia-block-style style #:height (&% 100.0))]
      [(#:focus) (remake-dia-block-style style #:font-paint 'DarkGoldenrod #:stroke-color 'Gold)]
      [(#:critical) (remake-dia-block-style style #:font-paint 'Crimson #:stroke-color 'Firebrick)])))

(define t:pin (geo-inset (geo-square 8 #:stroke ts:pin) 2.0))
(define s:pin (geo-inset (geo-square 8 #:stroke ss:pin) 2.0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define captions
  #hasheq((LandOn . "确定作品主题\n[三原色打靶游戏]")
          (t:Create . "创建新的“游戏世界”")
          (s:Copy . "复制最接近的作品")
          (s:Modify . "修改新作品的“游戏世界名称”")
          (t:Register . "将新世界注册到作品集主界面")
          (s:Register . "将新世界注册到作品集主界面")
          (t:goal1 . "构建目标原型1\n[静态角色、打靶平台]")
          (s:goal1 . "完成活动目标1\n[回顾练习锚点定位系统]")
          (t:goal2 . "构建目标原型2\n[角色控制]")
          (s:goal2 . "探索活动目标2\n[水平移动、跳跃、边界碰撞策略]")
          (s:physics . "定义和微调物理常量\n[速度、重力加速度]")
          (t:goal3 . "构建目标原型3\n[子弹控制]")
          (s:goal3 . "探索活动目标3\n[子弹复位、弹道轨迹、碰撞检测]")
          (t:goal4 . "构建目标原型4\n[靶子传送带、靶子状态机]")
          (s:goal4 . "探索活动目标4\n[传送带锚点定位、靶子运动属性]")
          (refactor#focus . "重构\n[理解“函数”的复用功能]")
          (update#critical . "调试 update 函数\n[深度思考状态代码顺序]")
          (t:goal5 . "构建目标原型5\n[靶子变换机制]")
          (s:goal5 . "完成活动目标5\n[数组和随机数的简单应用]")
          (t:goal6 . "构建目标原型6\n[子弹变色机制]")
          (s:goal6 . "完成活动目标6\n[真三原色打靶游戏完成]")
          (gobjects . "定义新世界中的“物体”\n[角色、道具、背景]")
          (LookBack . "回顾\n[顺便瞎折腾多段跳]")
          (Summary . "项目总结")

          (#:me . "【我】")
          (#:he . "学生")
          
          (#:/doc/t:PBL.git/ . "PBL.git\n@架构师的跨学科课堂")
          (#:/doc/s:PBL.git/ . "PBL.git\n@学生本地作品集")
          
          (#:t#class . "PaddleBallWorld")
          (#:ssrc#class . "ColorMixtureWorld")
          (#:t#class . "BullseyeWorld")
          (#:s#class . "BullseyeWorld")))

(define mefigure
  (parameterize ([default-uc-block-theme-adjuster actor-colorize])
    (assert (dia-use-case-block #:block-desc captions '#:me))))

(define hefigure
  (parameterize ([default-uc-block-theme-adjuster actor-colorize])
    (assert (dia-use-case-block #:block-desc captions '#:he))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-activity-diagram! bullseye.act
  #:parameterize ([default-act-block-theme-adjuster act-adjust]
                  [default-dia-free-track-label-inline? #false])
  [#:block-desc captions #:frame 'White] #:-
  (move-down 1 'LandOn)

  [#:tree (move-down 1 '-===)
   [=> (move-left 1.618)
       (stamp mefigure 'cb -0.1i)
       [#:tree (move-down 1 't:Create)
        [=> (move-left-down 1.0 1.0)
            (move-left 0.6 '#:/doc/bullseye.hpp#.t)
            (move-leftward 1 #false '#:save)
            (turn-left-up)
            (move-up 't:Create '#:/doc/t:PBL.git/)
            (move-to 't:Create '#:open)]
        [=> (move-left-down 1.0 1.8)
            (move-left 0.6 '#:/doc/bullseye.cpp#.t)
            (move-leftward 1 #false '#:save)
            (turn-left-up)
            (move-to '#:/doc/t:PBL.git/)]]

       (move-down 3 '#:t#class)
       (move-down 1 't:Register)

       [#:seq
        [(move-down 1.5 't:goal1 t:pin) => (move-right '#:home '#:/主角布局界面#screen '#:display)]
        [(move-down 1.0 't:goal2 t:pin) => (move-right '#:home '#:/角色控制界面#screen '#:display)]
        [(move-down 3.0 '同步...#.2 t:pin) => #;do-nothing ]
        [(move-down 1.5 't:goal3 t:pin) => (move-right-down '#:home 0.0 '#:/弹道轨迹界面#screen '#:display)]
        [(move-down 2.5 't:goal4 (cons #false t:pin)) => (move-right '#:home '#:/靶子传送界面#screen '#:display)]
        [(move-down 4.5 '同步...#.4 t:pin) => #;do-nothing ]
        [(move-down 1.5 't:goal5 t:pin) => (move-right '#:home '#:/靶子变换界面#screen '#:display)]
        [(move-down 1.0 't:goal6 t:pin) => (move-right '#:home '#:/最终效果#screen '#:display)]
        [(move-down 1.5) => (move-left '#:home '===-)]]]

   ; student's lane
   [=> (move-right 1.618)
       (stamp hefigure 'cb -0.1i)

       [#:tree (move-down 1 's:Copy)
        [=> (move-right-down 1.0 1.0)
            (move-right 0.6 '#:/doc/bullseye.hpp#.s)
            (move-rightward 1 #false '#:save)
            (turn-right-up)
            (move-up 's:Copy '#:/doc/s:PBL.git/)
            (move-to 's:Copy '#:open)]
        [=> (move-right-down 0.8 1.2)
            (move-right-down 0.2 0.6)
            (move-right 0.6 '#:/doc/bullseye.cpp#.s)
            (move-rightward 1 #false '#:save)
            (turn-right-up)
            (move-to '#:/doc/s:PBL.git/)]]
       
       (move-down 1 '#:ssrc#class)
       (move-down 1 's:Modify)
       (move-down 1 '#:s#class)
       (move-down 1 's:Register)
       (move-down 1 'gobjects s:pin)
       (move-down 1 's:goal1 s:pin)
       (move-down 1 's:goal2 s:pin)

       (move-down 1 '+handy- s:pin)
       (move-down 1 's:physics s:pin)
       
       [#:tree (move-down 1 'handy? s:pin)
        [=> (move-right 1.0 #false (cons "[不顺手]" #false))
            (L-step '+handy- #false s:pin)]
        [=> (move-down 1.5 's:goal3 (cons "[顺手]" s:pin))
            (move-down 0.75 '.break)
            (move-down 0.75 'LookBack s:pin)
            (move-down 1.0 's:goal4 s:pin)
            (move-down 1.0 'refactor#focus s:pin)
            
            (move-down 1 '+update- s:pin)
            (move-down 1 'update#critical s:pin)

            [#:tree (move-down 1 'okay? s:pin)
             [=> (move-right 1.0 #false (cons "[完全不可玩]" #false))
                 (L-step '+update- #false s:pin)]
             [=> (move-down 2.0 's:goal5 (cons "[基本可玩]" s:pin))
                 (move-down 1.0 's:goal6 s:pin)
                 (L-step '===-)]]]]

       [#:seq
        [(jump-to '#:/主角布局界面#screen) => (move-to 's:goal1 '#:watch)]
        [(jump-to '#:/doc/s:PBL.git/) => (shuffle-right 2.0) (move-down 's:goal2 '#:/doc/paddleball.cpp '#:open) (move-to 's:goal2 '#:read)]
        [(jump-to '#:/角色控制界面#screen) => (move-to 's:goal2 '#:watch)]
        [(jump-to '#:/弹道轨迹界面#screen) => (move-to 's:goal3 '#:watch)]
        [(jump-to '#:/靶子传送界面#screen) => (move-to 's:goal4 '#:watch)]
        [(jump-to '#:/靶子变换界面#screen) => (move-to 's:goal5 '#:watch)]
        [(jump-to '#:/最终效果#screen) => (move-to 's:goal6 '#:watch)]
        [(jump-up '.break) [=> (jump-left '#:/doc/t:PBL.git/)
                               (move-right '#:/doc/s:PBL.git/ #false "[class break after 3 hours]")]]]]
   ]

  (jump-to '===-)
  (move-down 1 'Summary)
  (move-down 1 '$)

  (note #:stereotype 'C++
        'gobjects 1.618 0
        "给游戏世界中的物体“起名字”："
        "Tuxmon* hero;"
        "Rectanglet* platform;"
        "Rectanglet* conveyor;"
        "Rectanglet* bullseye;"
        "Circlet* bullet;")
  
  (note #:stereotype 'C++
        's:physics 1.618 -pi
        "给游戏世界中的物体“起名字”："
        "double hero_speed = 3.0;"
        "double bullet_speed = 10.0;"
        "double gravity_acceleration = 0.1;")

  (note #:stereotype 'C++
        'refactor#focus 1.618 0
        "重构出两个私有函数:"
        "void bullet_home();"
        "void bullseye_home();")

  (note #:stereotype 'bonus
        's:goal6 1.618 0
        "学生沉浸在自己的作品里"
        "惊讶于连续五个青色靶子是bug"
        "这就是“随机”的真实效果"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ main
  bullseye.act)
