;;;;;;;;;;;;;;;;;; org mode

;;(with-eval-after-load 'org
;;  (settings with org)
;;  )

;;;;;;;; Org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;;;;;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files 
      '(
        "~/.emacs.d/org-files/gtd.org"
        ;;"~/.emacs.d/org-files/gtd2.org"
	)
      )
;;(setq org-agenda-files (list "~/.emacs.d/org-files/gtd.org" "~/.emacs.d/org-files/gtd2.org"))



(global-set-key (kbd "C-c a") 'org-agenda)


;;;;;;;;;;; 文学编程, 自动生成代码文件
(require 'org-install)
(require 'ob-tangle)
;;(org-babel-load-file (expand-file-name "/org/readme.org" user-emacs-directory))


;;;;; 设置 org 模板
;;(defun my-retrieve-chrome-current-tab-url()
;;    "Get the URL of the active tab of the first window"
;;    (interactive)
;;        (let ((result (do-applescript
;;                       (concat
;;                        "set frontmostApplication to path to frontmost application\n"
;;                        "tell application \"Google Chrome\"\n"
;;                        " set theUrl to get URL of active tab of first window\n"
;;                        " set theResult to (get theUrl) \n"
;;                        "end tell\n"
;;                        "activate application (frontmostApplication as text)\n"
;;                        "set links to {}\n"
;;                        "copy theResult to the end of links\n"
;;                        "return links as string\n"))))
;;          (format "%s" (s-chop-suffix "\"" (s-chop-prefix "\"" result)))))

(setq org-capture-templates
      '(
	("t" "Todo" entry (file+headline "~/.emacs.d/org-files/gtd.org" "工作安排")
	 "** TODO [#B] %?\n  %i\n"
	 :empty-lines 1)
	("l" "link" entry (file+headline "~/.emacs.d/org-files/gtd.org" "Link Notes")
	 ;;"* TODO [#C] %?\n %(my-retrieve-chrome-current-tab-url)\n %i\n %U"
	 "* TODO [#C] %?\n %i\n %U"
	 )
	)
      ) 
(global-set-key (kbd "C-c r") 'org-capture)

(setq org-startup-indented t)


(require 'org-pomodoro)
(setq org-pomodoro-long-break-length 40)

(provide 'init-org)

