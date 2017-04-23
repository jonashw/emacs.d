(setq evil-search-module 'evil-search)
(require 'evil)
(require 'hydra)
;;(setq evil-default-state 'emacs)
(evil-mode 1)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
;;
;;(define-key global-map (kbd "C-c v") 'turn-on-evil-mode)
;;(define-key global-map (kbd "C-c V") 'turn-off-evil-mode)
;;(define-key global-map (kbd "C-c v") 'turn-on-evil-mode)

(define-key global-map (kbd "C-c v") 'hydra-evil-mode/body)
(defhydra hydra-evil-mode (:color blue)
  "evil-mode"
  ("o" turn-on-evil-mode  "turn evil mode ON")
  ("O" turn-off-evil-mode "turn evil mode OFF")
  ("r" (lambda () (interactive)
		 (turn-off-evil-mode)
		 (turn-on-evil-mode)) "RESTART evil mode"))
;;
;;C-h is for emacs help (very important!)
;;(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
;;C-l scrolls the buffer around the cursor (can't override it)
;;(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
;;; Use ESCAPE to quit everything!
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;Avy motions
(define-key evil-normal-state-map (kbd "g w") 'avy-goto-word-1)
(define-key evil-motion-state-map (kbd "g w") 'avy-goto-word-1)
(define-key evil-normal-state-map (kbd "g c") 'avy-goto-char)
(define-key evil-motion-state-map (kbd "g c") 'avy-goto-char)
(define-key evil-normal-state-map (kbd "g C") 'avy-goto-char-2)
(define-key evil-motion-state-map (kbd "g C") 'avy-goto-char-2)

;;Visual mode
(define-key evil-visual-state-map (kbd "o") 'evil-visual-exchange-corners) ;;Why doesn't this work?

(evil-set-initial-state 'dired-mode 'normal)

(require 'key-chord)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

;;Allow spacebar to be used as a prefix key in normal mode
(define-key evil-normal-state-map " " nil)

(provide 'init-evil)
