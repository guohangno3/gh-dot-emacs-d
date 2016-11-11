;;;;;;;;;;;;;;;;;; org mode



(setq org-src-fontify-natively t)
;;(setq org-agenda-files (list "~/.emacs.d/org-files/gtd.org"))
;;(setq org-agenda-files '("~/.emacs.d/org-files/gtd.org"))
;;(setq org-agenda-files "~/.emacs.d/org-files/gtd.org")
;;(setq org-agenda-files '(concat user-emacs-directory "org-files"))

(global-set-key (kbd "C-c a") 'org-agenda)

;;;;;;;;;;; 

;;(org-babel-load-file (expand-file-name "gh.org" user-emacs-directory))







(provide 'init-org)

