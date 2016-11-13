;;;;;;;;;;;; 快速打开配置文件
(defun my-open-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el")
)
(global-set-key (kbd "<f2>") 'my-open-init-file)
;;(global-set-key (kbd "<f2> <f3>") 'my-open-init-file)
;;(global-set-key (kbd "<f2>\ <f3>") 'my-open-init-file)


;;;;;;;;;;;; 快速打开gtd文件
(defun my-open-gtd-file()
    (interactive)
    (find-file "~/.emacs.d/org-files/gtd.org")
)
(global-set-key (kbd "<f3>") 'my-open-gtd-file)


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(global-set-key (kbd "C-2") 'set-mark-command)


(global-set-key (kbd "C-=") 'er/expand-region)


;;;;;;;; helm ag
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)


;;(global-key-binding (kbd "C-w") 'backward-kill-word)




(provide 'init-keybindings)

