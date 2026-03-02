#lang typed/racket/base

(provide (all-defined-out))

(require diafun/flowchart)
(require diafun/usecase)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-flowchart! prepare.flow
  #:parameterize ([default-flow-track-label-rotate? #true]
                  [default-flow-track-label-inline? #false])
  [#:start-name "序章" #:frame 'White] #:-
  (move-down 1 '|自备个人电脑!|)
  (move-down 1 'λ|认识 Shell|)

  [#:tree (move-down 1 '#:-=)

   [=> (move-left 1.5 #false "奥数入口")

       [#:tree (move-down 1.6 (string->symbol "λ数列\n（递推公式/通项公式）"))
        [=> (move-left 1.0)
            (move-down 1 '--|同音替换密码|--)
            (move-down 1)
            (move-right 1 'λ|胡克定律探究实验|)
            (move-down 1.4)
            (move-right '#:-= '=-)
            (move-down 1 (string->symbol "&PBL."))]
       
        [=> (move-down 'λ|胡克定律探究实验|)]]]

   [=> (move-down 1.6 (string->symbol "λ位值制概念\n十进制展开式和移位运算") "数学入口")
       (move-down 1 'λ|数值的不同进制展开|)
       (move-down 1 (string->symbol "λ扩展与应用\n时分秒、256进制、RGB色彩空间"))

       (move-down '=-)]

   [=> (move-right 1.5 #false "写作视角入口")
       (move-down 1.6 '#:λ|踢猫效应游戏|)

       [#:tree (move-down 1 '#:λ|过程式 vs 对象式|)

        [=> (move-downwards '=-)
            (turn-down-left)
            (move-left '=-)]

        [=> (move-right 1.0)
            (move-down 1.5 (string->symbol "--邹忌讽齐王纳谏\n(类、对象、初始化)--"))
            (L-step '=-)]]]]

  (jump-to 2 (string->keyword "/plteen.fun\n@架构师的跨学科课堂"))
  (move-down 'λ|认识 Shell|)
  (move-leftwards 'λ|认识 Shell| #false (cons "git pull" #false))
  (sidestep-left 2)
  (move-left 2 '|/doc//[name]/workspace/| (cons #false "mkdir")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-flowchart! hsdec.flow
  #:parameterize ([default-flow-track-label-inline? #false]
                  [default-flow-track-label-rotate? #true])
  [#:start-name "同音替换解密\n@架构师的跨学科课堂" #:frame 'White
   #:block-desc #hasheq((initial-cipher-table! . "初始化明文符号表\nPlaintext")
                        (>>cipher . "读取密文\ncipher")
                        (okay? . "读取成功?")
                        (wrap . "环绕到最小密文 c")
                        (<<plain . "输出 Plaintext 中\nc 前一个位置处的字符"))] #:-
  (move-down 1 'initial-cipher-table!)
  (move-down 1 '>>cipher)
  (move-down 1 'okay?)
  (move-down 1 'wrap "Yes")
  (move-down 1 '<<plain)
  (move-down 0.75)
  (move-left 1.2)
  (L-step '>>cipher "下一个密文")

  (jump-to 'okay?)
  (move-right 1.2 #false "No")
  (move-down '<<plain)
  (move-down 1.0)
  (move-left '#:home)
  (move-down 0.75 'Done$))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define title : String "JrLab && 项目制教学体系\n@架构师的跨学科课堂")

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
          [(#:stu) (remake-dia-block-style style #:fill-paint 'LightGreen #:stroke-color 'transparent)]))))

(define pbl-desc
  #hasheq((#:Researcher . "教研老师")
          (#:Teacher . "教学老师")
          (#:Student . "学生")
          (#:Parent . "家长")
          (arch#dev . "设计教学引擎")
          (code#dev . "实现教学引擎")
          (asset . "预制素材资源")
          (api#dev . "规范命名 API")
          (train . "培训系统用法")
          (doc . "编写用户文档")
          (example#edu . "编写范例项目")
          (bdd#dev . "行为驱动开发")
          (deploy . "部署系统\n同步课程源码")
          (develop#edu . "研发课程")
          (demo#edu . "编写演示程序")
          (fit#edu . "裁剪课程项目")
          (dup#stu . "完成课程项目")
          (experiment#edu . "设计实验\n准备实验环境")
          (experiment#stu . "做实验")
          (cthinking#stu . "分解、识别\n抽象、建模")
          (trade-off#edu  . "权衡新旧知识点")
          (report#stu . "项目总结与报告")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-use-case-diagram! pbl.uc #:start '#:Engineer
  #:parameterize ([default-uc-block-theme-adjuster pbl-colorize])
  [#:frame 'White #:start-name "软件工程师" #:block-desc pbl-desc] #:-

  (actor-use 2 -pi/4 'arch#dev)
  (actor-use 2 0 'code#dev)
  (actor-use 2 +pi/4 'train)
  
  (jump-to 'code#dev)
  (case-include 2.5 -pi/8 'bdd#dev)
  (case-extend 2.5 +0 'asset)
  
  (jump-to 'arch#dev)
  (case-include 2.5 -pi/12 'api#dev)
  (case-include 'bdd#dev)
  
  (jump-to 'train)
  (case-include 2 -pi/12 'doc)
  (case-include 2 +pi/12 'example#edu)
  (case-extend 2 +5pi/12 'develop#edu)

  (jump-to -0.5+8i '#:Teacher)
  (actor-use 2 -pi/6 'fit#edu)
  (actor-use 3 0 'deploy)
  (actor-use 3+9i 'report#stu)
  
  [#:tree (jump-to -0.5+4i '#:Researcher)
   [=> (actor-use 2.0 +pi/8 'demo#edu)
       (actor-use 'develop#edu)
       (case-include 'example#edu)]
   [=> (actor-generalize '#:Teacher)]]

  (jump-to 'develop#edu)
  (case-include 2.5 -pi/12 'trade-off#edu)
  (case-extend 2.0 +pi/8 'experiment#edu)
  (case-include 3.0+5.5i 'cthinking#stu)

  [#:tree (jump-to 6+8i '#:Student)
   [=> (actor-use 2.0 -7pi/8 'dup#stu)
       (actor-use 3.2 -5pi/8 'experiment#stu)
       (actor-use 'report#stu)]
   [=> (actor-use 'deploy)]]

  (jump-to 6+6i '#:Parent)
  
  (extend 'fit#edu 'cthinking#stu)
  (extend 'dup#stu 'cthinking#stu)
  (extend 'dup#stu 'experiment#stu)

  (jump-to 0.5-3.75i '#:.sys)
  (T-step 5+13.5i title)
  (T-step '#:.sys)

  (note '#:Parent 1 pi/4 "首任老师" "表现出重视" "支持孩子学习"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ main
  prepare.flow
  hsdec.flow
  pbl.uc)
