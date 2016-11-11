

(global-auto-revert-mode t)

(global-linum-mode t)

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



;; 光标在括号内时就高亮包含内容的两个括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "hilight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)
	     ))
	)
)
;;(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(show-paren-mode)

;;;;; company
(setq-default company-minimum-prefix-length 2)
(setq-default company-idle-delay 0.08)

(setq ring-bell-function 'ignore)

(delete-selection-mode 1)



(defun test-autoload-1()
    (interactive)
    (message "test-autoload hello xxxxxxxxxxxxx")
)


;;;;;;;;;;;; indent
;(electric-indent-mode 1)
(defun indent-buffer ()
    "Indent the currently visited buffer."
    (interactive)
    (indent-region (point-min) (point-max))
)
(defun indent-region-or-buffer()
    "Indent a region if selected, otherwise the whole buffer."
    (interactive)
    (save-excursion
        (if (region-active-p)
            (progn
                (indent-region (region-beginning) (region-end))
                (message "Indented selected region.")
            )
            (progn
                (indent-buffer)
                (message "Indented buffer.")
            )
        )
    )
)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

  


;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list 
    '(
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol
    )
)
(global-set-key (kbd "C-/") 'hippie-expand)


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




;;;;; C-q C-m to generate (^M)
(defun hidden-dos-eol ()
  "Do not show (^M) in files containing mixed UNIX and DOS line ending."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\ [])
  )

(defun remove-dos-eol()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "\r" nil t)
      (replace-match ""))
    )
  )

(setq popwin:popup-window-position 'bottom)

;; improve occur
(defun occur-dwim ()
    "Call `occur' with a sane default."
    (interactive)
    (push (if (region-active-p)
              (buffer-substring-no-properties
               (region-beginning)
               (region-end))
            (let ((sym (thing-at-point 'symbol)))
              (when (stringp sym)
                (regexp-quote sym))))
          regexp-history)
    (call-interactively 'occur)
)
(global-set-key (kbd "M-s o") 'occur-dwim)
    


(defun my-byte-compile-and-recompile-directory (directory)
  (interactive "DByte compile and recompile directory: \n")
  (byte-recompile-directory directory 0)
  )
;;(my-byte-compile-and-recompile-directory "~/.emacs.d")

(defun my-byte-compile-and-recompile-directory-force (directory)
  (interactive "DByte compile and recompile directory: \n")
  (byte-recompile-directory directory 0 t)
  )

;;(setq default-directory "~")

;(require 'hungry-delete)
(global-hungry-delete-mode t)


;;(require 'smartparens-config) ;; auto-load
(smartparens-global-mode t)



;; 修正lisp模式下输入单引号的问题
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;; 也可以把上面两句合起来
;;(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)


(global-company-mode t)



(require 'popwin)
(popwin-mode t)



;;;;;;;;;;;;;;;; swiper
(require 'swiper)
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
;(global-set-key (kbd "C-c p f") 'counsel-git)
;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;(global-set-key (kbd "C-c k") 'counsel-ag)
;(global-set-key (kbd "C-x l") 'counsel-locate)
;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
(global-set-key (kbd "M-s i") 'counsel-imenu)



(provide 'init-better-defaults)

