(define-key evil-normal-state-map "-" 'dired-jump)
(define-key dired-mode-map "-" 'dired-up-directory)
(define-key dired-mode-map "u" 'dired-up-directory)
(define-key dired-mode-map "o" 'dired-find-file)
(define-key dired-mode-map "B" 'bookmark-jump) ;; NOTE: Masks BYTECODE compilation
;;(define-key evil-normal-state-map (kbd "g g") 'beginning-of-buffer) ;;Doesn't work!
(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(setq dired-listing-switches "-ld --group-directories-first")

(provide 'init-dired)
