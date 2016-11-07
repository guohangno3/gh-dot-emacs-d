
;;;;;; 
(setq auto-mode-alist
      (append
       ;; File name (within directory) starts with a dot.
       '(("/\\.[^/]*\\'" . fundamental-mode)
         ;; File name has no dot.
         ("/[^\\./]*\\'" . fundamental-mode)
         ;; File name ends in ¡®.C¡¯.
         ("\\.C\\'" . c++-mode)
         ("\\.js\\'" . js2-mode)
         ("\\`/tmp/fol/" . text-mode)
         ("\\.texinfo\\'" . texinfo-mode)
         ("\\.texi\\'" . texinfo-mode)
         ("\\.el\\'" . emacs-lisp-mode)
         ("\\.c\\'" . c-mode)
         ("\\.h\\'" . c-mode)
         )
       auto-mode-alist)
)

;;;;;;;;;;;;;;; nodejs
;;(require 'nodejs-repl)
;;(nodejs-repl)




(provide 'init-mode)