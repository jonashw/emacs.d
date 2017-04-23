(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-mode-fuzzy-match t)
(setq helm-candidate-number-limit 100)
(helm-flx-mode +1)

(provide 'init-helm)
