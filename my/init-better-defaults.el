
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


(setq visible-bell t)
;;(setq inhibit-startup-message t)
(setq column-number-mode t)
;;(setq mouse-yank-at-point t)
(setq kill-ring-max 200)
(setq default-fill-column 60)

;;; 不用tab来indent
(setq-default indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-stop-list ())
(loop for x downfrom 40 to 1 do
      (setq tab-stop-list (cons (* x 4) tab-stop-list)))


;;; 设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插 入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)


;;; 可以递归的使用 minibuffer。
(setq enable-recursive-minibuffers t)


;;; 防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
(setq scroll-margin 3
      scroll-conservatively 10000)


;;; 把缺省的 major mode 设置为 text-mode, 而不是几乎什么功能也 没有的 fundamental-mode.
(setq default-major-mode 'text-mode)


;;; 括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)


;;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)


;;; 在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用 的提示。
(setq frame-title-format "emacs@%b")


;;; 让 Emacs 可以直接打开和显示图片。
(auto-image-file-mode)


;;; 进行语法加亮。
(global-font-lock-mode t)


;;; 把这些缺省禁用的功能打开。
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)


;;; 设置一下备份时的版本控制，这样更加安全。
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)


;;; 设置有用的个人信息。这在很多地方有用。
(setq user-full-name "Guo Hang")
(setq user-mail-address "guohangno3@163.com")


;;; 让 dired 可以递归的拷贝和删除目录。
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)







(provide 'init-better-defaults)

