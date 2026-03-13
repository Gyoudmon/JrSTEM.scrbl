#lang typed/racket/base

(provide (all-defined-out))

(require diafun/flowchart)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define host-name "plteen.fun")
(define host (string->symbol (format "/~a\n@架构师的跨学科课堂" host-name)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define git-clone-string : (-> Symbol Path-String String)
  (lambda [repo dest]
    (format "git clone stem@~a:~a.git ~a/~a" host-name repo dest repo)))

(define raco-pkg-install-string : (-> Path-String String)
  (lambda [pkg]
    (format "raco pkg install --auto --link ~a" pkg)))

(define scp-string : (-> Symbol Path-String String)
  (lambda [src dest]
    (format "scp -r stem@~a:~a ~a/~a" host-name src dest src)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-flowchart! setup.dia #:at 2 [#:start-name "Setup" #:frame 'White] #:-
  (jump-to 5.5 host)
  (jump-to '#:home)
  
  (move-down 1 ':|Run PowerShell|)

  [#:tree (move-down 1.2 (string->keyword ">>:选择工作目录"))
   [=> [#:tree (move-down 1.5 (string->keyword ">>:下载开发软件") "cd D:/[name]")
        [=> (move-down 1.2 (string->symbol ":安装开发软件"))
            (move-down 1.2 (string->symbol ":编辑PATH环境变量") "sysdm.cpl")
            
            [#:tree (move-down 1.2 (string->keyword ">>:克隆我开发的课程软件"))
             [=> (move-down 1.5 (string->symbol ">>:安装我的课程软件")
                            (string-append "raco pkg install --auto --link C:/digimon " "\n"
                                           "raco pkg install --auto --link C:/graphics"))
                 
                 [#:tree (move-down 1.2 (string->keyword ">>:克隆课程源码库"))
                  [=> (move-down 1 'End$)]
                  [=> (jump-left 2 '|/doc/~/[repo]/|)
                      (jump-to host)
                      (L-step '|/doc/~/[repo]/| #false (cons (string-append (git-clone-string 'pbl "D:/[name]") "\n"
                                                                            (git-clone-string 'noi "D:/[name]")) #false))]]]
             
             [=> (jump-left 2 '/doc/C:/opt/)
                 (jump-to host)
                 (L-step '/doc/C:/opt/ #false (cons (string-append (git-clone-string 'digimon " C:/opt") " \n"
                                                                   (git-clone-string 'graphics "C:/opt") "\n"
                                                                   (git-clone-string 'JrPLT "   C:/opt") "   ") #false))]]]
   
        [=> (jump-left 2 '/doc/~/software/)
            (jump-to host)
            (L-step '/doc/~/software/ #false (cons (scp-string 'software "D:/[name]") #false))]]]
  
   [=> (move-left 2 '|/doc/D:/[name]/| "mkdir D:/[name]")]])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ main
  setup.dia)
