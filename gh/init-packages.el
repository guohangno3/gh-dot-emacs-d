
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
        
        ("melpa"        .   "http://elpa.zilongshanren.com/melpa/")
        ("gnu"          .   "http://elpa.zilongshanren.com/gnu/")
        ("melpa-stable" .   "http://elpa.zilongshanren.com/melpa-stable/")
        ("marmalade"    .   "http://elpa.zilongshanren.com/marmalade/")
        ("org"          .   "http://elpa.zilongshanren.com/org/")
        ("melpa"        .   "https://melpa.org/packages/")
    )
)

;; cl - Common Lisp Extension
(require 'cl)
(require 'js2-mode)


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

	iedit

	window-numbering
	;;window-number 
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

(defun my-install-all-packages()
  (interactive)
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
)
;;(my-install-all-packages)


;; example : to always assign the calculator window the number 9
;;(setq window-numbering-assign-func
;;      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))

;;(require 'window-number)
;;(window-number-mode 1)
;;(global-set-key (kbd "C-x o") 'window-number-switch)


;;(require 'smartparens)
;;(require 'smartparens-config) ;; auto-load
(smartparens-global-mode t)

(require 'popwin)
(require 'swiper)

;;(require 'hungry-delete)
;;(require 'hungry-delete)

(require 'org)
(require 'org-install)
(require 'ob-tangle)



(provide 'init-packages)
