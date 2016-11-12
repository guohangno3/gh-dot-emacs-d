;;;;;;;;;;;;;;;;;; org mode


;;;;;;;; Org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;;;;;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files 
    '(
        "~/.emacs.d/org-files/gtd.org"
        ;;"~/.emacs.d/org-files/gtd2.org"
    )
)
;;(setq org-agenda-files (list "~/.emacs.d/org-files/gtd.org" "~/.emacs.d/org-files/gtd2.org"))



(global-set-key (kbd "C-c a") 'org-agenda)


;;;;;;;;;;; 文学编程, 自动生成代码文件
(require 'org-install)
(require 'ob-tangle)
;;(org-babel-load-file (expand-file-name "/org/readme.org" user-emacs-directory))


;;;;; 设置 org 模板
(setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/.emacs.d/org-files/gtd.org" "工作安排")
           "** TODO [#B] %?\n  %i\n"
           :empty-lines 1)))
(global-set-key (kbd "C-c r") 'org-capture)




(provide 'init-org)

