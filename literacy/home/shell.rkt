#lang typed/racket/base

(provide (all-defined-out))

(require diafun/flowchart)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define host-name "plteen.fun")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define git-clone-string : (-> Symbol Path-String String)
  (lambda [repo dest]
    (format "git clone stem@~a:~a.git ~a/~a" host-name repo dest repo)))

(define raco-pkg-install-string : (-> Path-String String)
  (lambda [pkg]
    (format "> raco pkg install --auto --link ~a" pkg)))

(define scp-string : (-> Symbol Path-String String)
  (lambda [src dest]
    (format "scp -r stem@~a:~a ~a/~a" host-name src dest src)))

(define captions
  (make-immutable-hasheq
   (list (cons '#:home "准备学习环境\n@架构师的跨学科课堂")
         (cons '#:/host (format "stem@~a" host-name))
         (cons ':RunPS "运行 PowerShell")
         (cons '>>:mkdir "创建工作目录")
         (cons '>>:scp "下载开发软件")
         (cons ':Install "安装开发软件")
         (cons '>>:sysdm.cpl "打开“系统属性”对话框")
         (cons ':env:Path "编辑 PATH 环境变量")
         (cons '>>:clone "克隆我的课程软件")
         (cons '>>:raco "安装我的课程软件")
         (cons '>>:src "克隆课程源码库"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-flowchart! setup.dia #:at 2
  #:parameterize ([default-dia-note-width 360.0])
  [#:block-desc captions #:frame 'White] #:-
  (jump-to 5.5 '#:/host)
  (jump-to '#:home)
  
  (move-down 1 ':RunPS)

  [#:tree (move-down 1  '>>:mkdir)
   [=> (move-left 2 '#:|/doc/D:/[name]/| "mkdir D:/[name]")]
   [=> [#:tree (move-down 1 '>>:scp)
        [=> (jump-left 2 '#:/doc/./software/)]
        [=> (move-down 1 ':Install)
            (move-down 1 '>>:sysdm.cpl)
            (note '>>:sysdm.cpl 1.5 0 "> sysdm.cpl")
            (move-down 1 ':env:Path)
            
            [#:tree (move-down 1 '>>:clone)
             [=> (jump-left 2 '#:/doc/C:/opt/)]
             [=> (move-down 1 '>>:raco)
                 (note '>>:raco 2 0
                       (raco-pkg-install-string "C:/digimon ")
                       (raco-pkg-install-string "C:/graphics"))
                 
                 [#:tree (move-down 1 '>>:src)
                  [=> (move-down 1 'End$)]
                  [=> (jump-left 2 '#:|/doc/./[repo]/|)]]]]]]]]

  [#:tree (jump-to '#:/host)
   [=> (L-step '#:|/doc/./[repo]/| #false
               (cons (string-append (git-clone-string 'pbl "D:/[name]") "\n"
                                    (git-clone-string 'noi "D:/[name]")) #false))]
   [=> (L-step '#:/doc/C:/opt/ #false
               (cons (string-append (git-clone-string 'digimon " C:/opt") " \n"
                                    (git-clone-string 'graphics "C:/opt") "\n"
                                    (git-clone-string 'JrPLT "   C:/opt") "   ") #false))]
   [=> (L-step '#:/doc/./software/ #false
               (cons (scp-string 'software "D:/[name]") #false))]])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ main
  setup.dia)
