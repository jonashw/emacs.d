(require 'smartparens-config)
(require 'evil-smartparens)
;; strict-mode is supposed to help you keep your parens balanced,
;; even through line deletions.
(smartparens-strict-mode)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

(provide 'init-smartparens)
;;(sp-local-pair 'html-mode "<" ">")
;;(sp-pair "<" ">")
;;(sp-local-tag '(sgml-mode html-mode) "<" "<_>" "</_>" :transform 'sp-match-sgml-tag)
