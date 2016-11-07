;;;;;;;;;;;;;;;;;; org mode
(require 'org)
(setq org-src-fontify-natively t)
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;;;;;;;;;;; 
(require 'org-install)
(require 'ob-tangle)
;(org-babel-load-file (expand-file-name "gh.org" user-emacs-directory))












(provide 'init-org)
