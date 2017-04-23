(require 'evil)
(require 'neotree)
(require 'dired)

(setq neo-smart-open t)

;;It appears I am unable to override C-t... this is the next best thing:
(define-key global-map (kbd "C-S-t") 'neotree-toggle)

;;Make evil and neotree play nicely
(with-eval-after-load 'neotree
  (add-hook 'neotree-mode-hook
	    (lambda()
	      (turn-off-evil-mode)
	      (message "WELCOME TO NEOTREE!!!!!")
	      ;;(evil-define-key 'normal neotree-node-map "ma" 'neotree-create-node)
	      (define-key evil-normal-state-local-map (kbd "C") 'neotree-change-root)
	      (define-key evil-normal-state-local-map (kbd "<return>") 'neotree-enter)
	      (define-key evil-normal-state-local-map (kbd "m a") 'neotree-create-node)
	      (define-key evil-normal-state-local-map (kbd "m d") 'neotree-delete-node)
	      (define-key evil-normal-state-local-map (kbd "m m") 'neotree-rename-node)
	      (define-key evil-normal-state-local-map (kbd "m c") 'neotree-copy-file)
	      (define-key evil-normal-state-local-map (kbd "o") 'neotree-enter)
	      (define-key evil-normal-state-local-map (kbd "O") (lambda ()
								  (interactive)
								  ;; This command opens the selected file
								  ;; and cycles neotree, making it appear
								  ;; that you never left neotree.
								  ;; (useful for quick previews of multiple files in a dir)
								  (neotree-enter)
								  (neotree-toggle)
								  (neotree-toggle)))
	      (define-key evil-normal-state-local-map (kbd "r") 'neotree-refresh)
	      (define-key evil-normal-state-local-map (kbd "u") 'neotree-select-up-node)
	      (define-key evil-normal-state-local-map (kbd "x") (lambda ()
								  ;; This command collapses the closet up-node.
								  (interactive)
								  (neotree-select-up-node)
								  (neotree-enter)))
	      (define-key evil-normal-state-local-map (kbd "i") (neotree-make-executor :file-fn 'neo-open-file-horizontal-split))
	      (define-key evil-normal-state-local-map (kbd "s") (neotree-make-executor :file-fn 'neo-open-file-vertical-split))
	      (define-key evil-normal-state-local-map (kbd "S") 'neotree-hidden-file-toggle)))
  'append 'local)

(provide 'init-neotree)
