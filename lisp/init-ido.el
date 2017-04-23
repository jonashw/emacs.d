(require 'ido)
(ido-mode)
(flx-ido-mode)
(setq ido-enable-flex-matching t)
(ido-everywhere 1)

;; If you don't want to use the flx's highlights you can turn them off like this:
;(setq ido-use-faces nil)

(provide 'init-ido)
