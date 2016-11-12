;;;;;;;;;;;; 快速打开配置文件
(defun open-my-init-file()
    (interactive)
    (find-file "~/.emacs.d/init.el")
)
(global-set-key (kbd "<f2>") 'open-my-init-file)
;;(global-set-key (kbd "<f2> <f3>") 'open-my-init-file)
;;(global-set-key (kbd "<f2>\ <f3>") 'open-my-init-file)


;;;;;;;;;;;; 快速打开gtd文件
(defun open-my-gtd-file()
    (interactive)
    (find-file "~/.emacs.d/org-files/gtd.org")
)
(global-set-key (kbd "<f3>") 'open-my-gtd-file)




(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)




(global-set-key (kbd "C-2") 'set-mark-command)



(global-set-key (kbd "C-=") 'er/expand-region)





(provide 'init-keybindings)

