
(global-auto-revert-mode t)


;; Ivy is a generic completion mechanism for Emacs
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;;;;;;;;;;;;;;; swiper
(require 'swiper)
(global-set-key "\C-s" 'swiper)
;;(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;;(global-set-key (kbd "<f1> l") 'counsel-load-library)
;;(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;;(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;;(global-set-key (kbd "C-c g") 'counsel-git)
;;(global-set-key (kbd "C-c p f") 'counsel-git)
;;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;;(global-set-key (kbd "C-c k") 'counsel-ag)
;;(global-set-key (kbd "C-x l") 'counsel-locate)
;;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;;(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
(global-set-key (kbd "M-s i") 'counsel-imenu)


;;;;; company completion
(global-company-mode t)
(setq-default company-minimum-prefix-length 2)
(setq-default company-idle-delay 0.08)


;;;;;;;; hippie completion
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





(delete-selection-mode 1)

;;;;;;;;;;;; indent
;;(electric-indent-mode 1)
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

;;;;; C-q C-m to generate (^M)
(defun remove-dos-eol()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "\r" nil t)
      (replace-match ""))
    )
  )


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

;;(require 'hungry-delete)
(global-hungry-delete-mode t)

;; 修正lisp模式下输入单引号的问题
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;; 也可以把上面两句合起来
;;(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)





(provide 'init-edit)

