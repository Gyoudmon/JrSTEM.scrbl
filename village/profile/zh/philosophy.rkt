#lang typed/racket/base

(provide (all-defined-out))

(require diafun/flowchart)
(require diafun/usecase)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-flowchart! prepare.flow
  #:parameterize ([default-flow-track-label-rotate? #true]
                  [default-flow-track-label-inline? #false])
  #:where ([shell (string->symbol "λ认识 Shell\n[初识函数]")])
  [#:start-name "序章"] #:-
  (move-down 1 shell)

  [#:tree (move-down 1 '#:-=)

   [=> (move-left 1.5 #false "奥数入口")

       [#:tree (move-down 1.6 (string->symbol "λ数列\n（递推公式/通项公式）"))
        [=> (move-left 1.0)
            (move-down 1 '--|同音替换密码|--)
            (move-down 1)
            (move-right 1 'λ|胡克定律探究实验|)
            (move-down 1)
            (move-right '#:-= '=-)
            (move-down 1 (string->symbol "&PBL."))]
       
        [=> (move-down 'λ|胡克定律探究实验|)]]]

   [=> (move-down 1.6 (string->symbol "λ位值概念与移位运算") "数学入口")
       (move-down 1 'λ|数值的不同进制展开|)
       (move-down 1 (string->symbol "λ扩展与应用\n时分秒、256进制、RGB色彩空间"))

       (move-down '=-)]

   [=> (move-right 1.5 #false "写作入口")
       (move-down 1.6 '#:λ|踢猫效应游戏|)

       [#:tree (move-down 1 '#:λ|过程式 vs 对象式|)

        [=> (move-downwards '=-)
            (turn-down-left)
            (move-left '=-)]

        [=> (move-right 1.0)
            (move-down 1.0 (string->symbol "--邹忌讽齐王纳谏\n(类、对象、初始化)--"))
            (L-step '=-)]]]]

  (jump-to 2 (string->keyword "/plteen.fun\n@架构师的跨学科课堂"))
  (move-down shell)
  (move-leftwards shell #false (cons "git pull" #false))
  (sidestep-left 2)
  (move-left 2 '|/doc//[name]/workspace/| (cons #false "mkdir")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define title : String "JrLab 项目制编程教学体系\n@架构师的跨学科课堂")

(define pbl-colorize : UC-Block-Theme-Adjuster
  (lambda [style id stereotype]
    (if (keyword? id)
        (case id
          [(#:Researcher #:Teacher) (remake-dia-block-style style #:fill-paint 'Yellow)]
          [(#:Engineer) (remake-dia-block-style style #:fill-paint 'DeepSkyBlue)]
          [(#:Parent) (remake-dia-block-style style #:fill-paint 'MediumOrchid)])
        (case stereotype
          [(#:dev) (remake-dia-block-style style #:fill-paint 'DeepSkyBlue #:stroke-color 'transparent)]
          [(#:edu) (remake-dia-block-style style #:fill-paint 'LemonChiffon #:stroke-color 'transparent)]
          [(#:edu!) (remake-dia-block-style style #:fill-paint 'LemonChiffon #:stroke-color 'DarkOrange)]
          [(#:stu) (remake-dia-block-style style #:fill-paint 'PaleGreen #:stroke-color 'transparent)]
          [(#:stu!) (remake-dia-block-style style #:fill-paint 'PaleGreen #:stroke-color 'CornflowerBlue)]))))

(define pbl-desc
  #hasheq((#:Researcher . "教研老师")
          (#:Teacher . "教学老师")
          (#:Student . "学生")
          (#:Parent . "家长")
          (arch#dev . "设计教学引擎")
          (code#dev . "实现教学引擎")
          (asset . "预制素材资源")
          (api#dev . "规范函数命名")
          (train . "培训系统用法")
          (doc . "编写用户文档")
          (example#edu . "编写范例项目")
          (bdd#dev . "行为驱动开发")
          (deploy . "部署系统\n同步课程源码")
          (develop#edu . "研发课程")
          (demo#edu . "编写演示程序")
          (fit#edu! . "管理认知负荷")
          (dup#stu . "完成课程项目")
          (experiment#edu . "设计实验\n准备实验环境")
          (experiment#stu . "实验探究")
          (cthinking#stu! . "分解、识别\n抽象、建模")
          (trade-off#edu!  . "权衡新旧知识点")
          (report#stu . "项目总结与报告")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-use-case-diagram! pbl.uc #:start '#:Engineer
  #:parameterize ([default-uc-block-theme-adjuster pbl-colorize])
  [#:start-name "软件工程师" #:block-desc pbl-desc] #:-

  (actor-use 2.5 -pi/8 'arch#dev)
  (actor-use 2.5 0 'code#dev)
  (actor-use 2.5 +pi/8 'train)
  
  (focus 'code#dev)
  (case-extend 2.5 +0 'asset)
  
  (focus 'arch#dev)
  (case-include 2.5 +0 'api#dev)
  
  (focus 'train)
  (case-include 2 0.0 'example#edu)
  (case-extend 2 +pi/2 'develop#edu)

  (jump-to 0.5+6.25i '#:Teacher)
  (actor-use 2 -pi/6 'fit#edu!)
  (actor-use 2.75 0 'deploy)
  (actor-use 3 +pi/8 'report#stu)
  
  [#:tree (jump-up 3.0 '#:Researcher)
   [=> (actor-use 1.5 +pi/6 'demo#edu)
       (actor-use 'develop#edu)
       (case-include 'example#edu)]
   [=> (actor-generalize '#:Teacher)]]

  (focus 'develop#edu)
  (case-include 2.25 -pi/8 'trade-off#edu!)
  (case-extend 2.25 0.0 'experiment#edu)
  (case-include 1.85 +pi/5 'cthinking#stu!)

  (focus '#:Teacher)
  [#:tree (jump-right 6 '#:Student)
   [=> (actor-use 2.0 -11pi/12 'dup#stu)
       (actor-use 2.5 -2pi/3 'experiment#stu)
       (actor-use 'report#stu)]
   [=> (actor-use 'deploy)]
   [=> (jump-up 2.25 '#:Parent)]]
  
  (extend 'fit#edu! 'cthinking#stu!)
  (extend 'dup#stu 'cthinking#stu!)
  (extend 'dup#stu 'experiment#stu)

  (jump-to 1-2.5i '#:.sys)
  (T-step 5+10.5i title)
  (T-step '#:.sys)

  (note '#:Parent 1 pi/4 "首任老师" "表现出重视" "支持孩子学习"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ main
  prepare.flow
  pbl.uc)
