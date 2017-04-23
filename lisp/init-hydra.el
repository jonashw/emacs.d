(require 'hydra)

;; Experimental hydras

;;A simulation of Resharper's menu configuration:
(defhydra hydra-resharper (:color blue)
  "resharper"
  ("r" hydra-resharper-refactor/body "refactor")
  ("n" hydra-resharper-navigate-to/body "navigate-to"))

(defhydra hydra-resharper-refactor (:color blue)
  "resharper/refactor"
  ("r" (lambda () (interactive) (message "renamed")) "rename")
  ("x" (lambda () (interactive) (message "interface extracted")) "extract interface")
  ("m" (lambda () (interactive) (message "moved")) "move"))

(defhydra hydra-resharper-navigate-to (:color blue)
  "resharper/navigate-to"
  ("a" (lambda () (interactive) (message "navigated to anything")) "anything")
  ("d" (lambda () (interactive) (message "navigated to declaration")) "declaration")
  ("m" (lambda () (interactive) (message "navigated to member")) "member")
  ("r" (lambda () (interactive) (message "navigated to recent")) "recent")
  ("t" (lambda () (interactive) (message "navigated to type")) "type")
  ("u" (lambda () (interactive) (message "navigated to usage")) "usages of symbol"))

;; A simple launcher:
(defhydra hydra-launcher (:color blue)
   "Launch"
   ("h" man "man")
   ("r" (browse-url "http://www.reddit.com/r/emacs/") "reddit")
   ("w" (browse-url "http://www.emacswiki.org/") "emacswiki")
   ("s" shell "shell")
   ("q" nil "cancel"))
(global-set-key (kbd "C-c r") 'hydra-launcher/body)

(provide 'init-hydra)
