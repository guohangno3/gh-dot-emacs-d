

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


(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;; dired
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(put 'dired-find-alternate-file 'disable nil)
(require 'dired-x)
(setq dired-dwim-target t)

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

(setq popwin:popup-window-position 'right)

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
    (call-interactively 'occur))





(provide 'init-better-defaults)
