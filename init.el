;;(package-initialize)

;; M-x info -> emacs lisp intro


(add-to-list 'load-path "~/.emacs.d/gh")
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-mode)
(require 'init-org)
(require 'init-keybindings)


;;;;;;;;;;;; autoload
;; (autoload 'test-autoload-1 "init-better-defaults")
;; (test-autoload-1)

;;(update-directory-autoloads "~/.emacs.d/gh")



(setq custom-file (expand-file-name "gh/custom.el" user-emacs-directory))
(load-file custom-file)





