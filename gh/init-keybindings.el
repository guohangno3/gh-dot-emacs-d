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
    (find-file "~/gtd.org")
)
(global-set-key (kbd "<f3>") 'open-my-gtd-file)


;;;;;;;;;;;;;;;; swiper
(global-set-key "\C-s" 'swiper)
;(global-set-key (kbd "C-c C-r") 'ivy-resume)
;(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;(global-set-key (kbd "<f1> l") 'counsel-load-library)
;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;(global-set-key (kbd "C-c g") 'counsel-git)
;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;(global-set-key (kbd "C-c k") 'counsel-ag)
;(global-set-key (kbd "C-x l") 'counsel-locate)
;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;(global-set-key "\C-x\ C-r" 'recentf-open-files)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)


;;(global-set-key (kbd "C-2") 'set-mark-command)


(global-set-key (kbd "C-c p f") 'counsel-git)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)


(global-set-key (kbd "C-/") 'hippie-expand)

;;;; 延迟定义，加载了dired之后再绑定，避免绑定
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
)





(provide 'init-keybindings)
