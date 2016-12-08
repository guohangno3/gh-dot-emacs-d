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
        ("popkit"       .   "http://elpa.popkit.org/packages/")
        )
      )

;; cl - Common Lisp Extension
(require 'cl)



;; Add Packages
(defvar my-packages  '(

    ;; --- Auto-completion ---
    company
    
    neotree
    ranger
    
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
    org-pomodoro

    ;; 插件可以自动将光标移动到，新创建的窗口中
    popwin

    web-mode
    
    ;;occur-mode
    
    expand-region
    
    iedit
    
    window-numbering
    ;;window-number 
    
    which-key
    hydra

    helm-ag

    flycheck

    ;;yasnippet
    auto-yasnippet


    ;; powerline
    ;; powerline-evil

    evil
    evil-leader
    evil-surround
    evil-nerd-commenter

    mwe-log-commands

    ;; pallet

    iimage

    use-package
    
    )
  "Default packages"
  )

(setq package-selected-packages my-packages)

(defun my-packages-installed-p()
       (loop for pkg in my-packages
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
       (unless (my-packages-installed-p)
               (message "%s" "Refreshing package database...")
               (package-refresh-contents)
               (dolist (pkg my-packages)
                       (when (not (package-installed-p pkg))
                         (progn
                           (message "xxx installing %s" pkg)
                           (package-install pkg)
                           )
                         )
                       )
               )
       )
(my-install-all-packages)
;; M-x package-install xxx

(require 'iedit)
;;(global-key-binding (kbd "M-s e") 'iedit-mode)

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


(require 'which-key)
(which-key-mode 1)
(setq which-key-side-window-location 'right)

(require 'js2-mode)


;;;;; flycheck
;;(global-flycheck-mode t)

(add-hook 'js2-mode-hook 'flycheck-mode)



;;;;; 代码块扩展
;;(yas-reload-all)
;;(add-hook 'prog-mode-hook #'yas-minor-mode)
;;;;; auto-yasnippet
;;(require 'yasnippet)
;;(global-key-binding (kbd "H-w") #'aya-create)
;;(global-key-binding (kbd "H-y") #'aya-expand)


(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
;;(setq-default evil-want-C-u-scroll t)
;;(global-set-key (kbd "C-w") 'backward-kill-word)
;;(global-set-key (kbd "C-z") 'evil-toggle-key)

;; 这些模式进入的时候是evil模式 
(dolist
    (mode
     '(ag-mode
       flycheck-error-list-mode
       git-rebase-mode
       )
     )
  (add-to-list 'evil-emacs-state-modes mode))
(add-hook
 'occur-mode-hook
 (lambda ()
   (evil-add-hjkl-bindings occur-mode-map 'emacs
     (kbd "/") 'evil-search-forward
     (kbd "n") 'evil-search-next
     (kbd "N") 'evil-search-previous
     (kbd "C-d") 'evil-scroll-down
     (kbd "C-u") 'evil-scroll-up
     ))
)


(global-evil-leader-mode)
;;(setq evil-leader/in-all-states t)
(setq evil-leader/leader "SPC")

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )


;; (require 'powerline)
;; (powerline-default-theme)
;; (require 'powerline-evil)


(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
;;(evilnc-default-hotkeys)



;; (mwe:open-command-log-buffer t)

;; iimage mode
(autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
(autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)



(provide 'init-packages)
