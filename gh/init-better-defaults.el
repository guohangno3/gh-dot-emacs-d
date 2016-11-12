
;;;;;;;;; 缩写, 用非字母或者数字来触发补全扩展
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table 
    '(
        ("8zl" "zilongshanren")
        ("8ms" "macrosoft")
    )
)


;;;;;;;;;;;;;; disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)


;;;;;;;;;;;;; recent file
;;(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 10)
;;(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;;(global-set-key "\C-x\ C-r" 'recentf-open-files)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)


(setq ring-bell-function 'ignore)


(fset 'yes-or-no-p 'y-or-n-p)


;;;;;;;;;; dired
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disable nil)
(require 'dired-x)
(setq dired-dwim-target t)
;;;; 延迟定义，加载了dired之后再绑定，避免绑定
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
)


(defun my-byte-compile-and-recompile-directory (directory)
  (interactive "DByte compile and recompile directory: \n")
  (byte-recompile-directory directory 0)
  )
;;(my-byte-compile-and-recompile-directory "~/.emacs.d")

(defun my-byte-compile-and-recompile-directory-force (directory)
  (interactive "DByte compile and recompile directory: \n")
  (byte-recompile-directory directory 0 t)
  )


(setq default-directory "d:/home/")

(set-language-environment "UTF-8")



(provide 'init-better-defaults)

