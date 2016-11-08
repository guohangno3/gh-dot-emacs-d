
;;;;;; 
(setq auto-mode-alist
    (append
        ;; File name (within directory) starts with a dot.
        '(
            ("/\\.[^/]*\\'" . fundamental-mode)
            ;; File name has no dot.
            ("/[^\\./]*\\'" . fundamental-mode)
            ;; File name ends in ¡®.C¡¯.
            ("\\.js\\'" . js2-mode)
            ("\\.html\\'" . web-mode)
            ("\\`/tmp/fol/" . text-mode)
            ("\\.texinfo\\'" . texinfo-mode)
            ("\\.texi\\'" . texinfo-mode)
            ("\\.el\\'" . emacs-lisp-mode)
            ("\\.h\\'" . c-mode)
            ("\\.c\\'" . c-mode)
            ("\\.C\\'" . c++-mode)
            ("\\.hpp\\'" . c++-mode)
            ("\\.cpp\\'" . c++-mode)
            ("\\.cc\\'" . c++-mode)
        )
        auto-mode-alist)
)

;;;;;;;;;;;;;;; nodejs
;;(require 'nodejs-repl)
;;(nodejs-repl)




(provide 'init-mode)