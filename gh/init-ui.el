
(global-linum-mode t)
(tool-bar-mode -1)
;;(scroll-bar-node -1)

;;(setq inhibit-splash-screen t)

(setq-default cursor-type 'bar)

(setq initial-frame-list (quote ((fullscreen . maximized))))

(global-hl-line-mode t)

(window-numbering-mode t)


(smartparens-mode t)
(show-paren-mode t)
;; 光标在括号内时就高亮包含内容的两个括号
(when (> emacs-major-version 24)
    (define-advice show-paren-function (:around (fn) fix-show-paren-function)
      "hilight enclosing parens."
      (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)
             ))
        )
    )
)
;;(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(show-paren-mode)

;;;;; C-q C-m to generate (^M)
(defun hidden-dos-eol ()
  "Do not show (^M) in files containing mixed UNIX and DOS line ending."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\ [])
  )


(require 'popwin)
(popwin-mode t)
(setq popwin:popup-window-position 'bottom)



(load-theme 'monokai t)

(provide 'init-ui)

