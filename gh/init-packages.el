
;;;;;;;;;;;;;;;;;;;;;; 添加源，自动安装package

;;(require 'package)
(package-initialize)

;; default is ("gnu" . "http://elpa.gnu.org/packages/")
(setq package-archives nil)

;;;;;; only one
;;(add-to-list 'package-archives '("melpa"   . "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa-cn" . "http://elpa.zilongshanren.com/melpa/") t)
;;(add-to-list 'package-archives '("org-cn"   . "http://elpa.zilongshanren.com/org/") t)
;;(add-to-list 'package-archives '("gnu-cn"   . "http://elpa.zilongshanren.com/gnu/") t)
(setq package-archives 
    '(
        ("gnu"          . "http://elpa.zilongshanren.com/gnu/")
        ("melpa"        . "http://elpa.zilongshanren.com/melpa/")
        ("melpa-stable" .   "http://elpa.zilongshanren.com/melpa-stable/")
        ("marmalade"    .   "http://elpa.zilongshanren.com/marmalade/")
        ("org"          .   "http://elpa.zilongshanren.com/org/")
    )
)

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages 
    '(
        ;; --- Auto-completion ---
        company
        neotree
        
        ;; --- Better Editor ---
        hungry-delete
        swiper
        counsel
        smartparens
        
        ;; --- Major Mode ---
        js2-mode
	js2-refactor
        
        ;; --- Minor Mode ---
        nodejs-repl
        ;;exec-path-from-shell
        
        ;; --- Themes ---
        monokai-theme
        ;; solarized-theme
        
        ;; --- org ---
        org

	;; 插件可以自动将光标移动到，新创建的窗口中
        popwin

	web-mode

	;;occur-mode

	expand-region
    )
    "Default packages"
)

(setq package-selected-packages my/packages)

(defun my/packages-installed-p()
    (loop for pkg in my/packages
        ;;if (not (package-installed-p pkg))
        when (not (package-installed-p pkg))
        do
        (progn
            (message "xxx %s not installed" pkg)
            (return nil)
        )
        ;else do
        ;(progn
        ;    (message "xxx %s installed" pkg)
        ;)
        
        finally 
        (progn
            (message "all packages are installed")
            (return t)
        )
    )
)

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
        (when (not (package-installed-p pkg))
            (progn
                (message "xxx installing %s" pkg)
                (package-install pkg)
            )
        )
    )
)

;(require 'hungry-delete)
(global-hungry-delete-mode t)

;;(require 'smartparens-config) ;; auto-load
(smartparens-global-mode t)


;; 修正lisp模式下输入单引号的问题
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)
;; 也可以把上面两句合起来
;;(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)



(require 'swiper)


(provide 'init-packages)
