;;(package-initialize)

;; M-x info -> emacs lisp intro

;;; my initialize
(add-to-list 'load-path "~/.emacs.d/my")
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-mode)
(require 'init-edit)
(require 'init-org)
(require 'init-ui)
(require 'init-keybindings)


;;;;;;;;;;;; autoload
;; (autoload 'test-autoload-1 "init-better-defaults")
;; (test-autoload-1)

;;(update-directory-autoloads "~/.emacs.d/my")



(setq custom-file (expand-file-name "my/custom.el" user-emacs-directory))
(load-file custom-file)

(put 'dired-find-alternate-file 'disabled nil)



;;(setq-default default-directory "~")

