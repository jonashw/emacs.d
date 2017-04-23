(require 'escreen)
(load "escreen")
(escreen-install)

(global-set-key (kbd "M-t") 'hydra-tabs/body)
(global-set-key (kbd "M-h") 'escreen-goto-prev-screen)
(global-set-key (kbd "M-l") 'escreen-goto-next-screen)

(require 'hydra)

(defhydra hydra-tabs (:color red)
  "escreen \"tabs\""
  ("t" escreen-create-screen "create" :color blue)
  ("K" escreen-kill-screen "kill")
  ("h" escreen-goto-prev-screen "previous")
  ("l" escreen-goto-next-screen "next")
  ("g" escreen-goto-screen-improved "goto" :color blue)
  ("m" escreen-menu "menu (in new window)" :color blue))

(defun escreen-goto-screen-improved (number)
  "Prompts for a screen number to goto, just like escreen-goto-screen,
   but also displays the range of available screen numbers and the number of the current screen"
  (interactive (list
				(let* ((screen-nums (escreen-get-active-screen-numbers))
					   (first-num (car screen-nums))
					   (last-num (car (last screen-nums)))
					   (prompt (format "Go to screen number [%d-%d] (currently in %d):"
									   first-num
									   last-num
									   escreen-current-screen-number)))
				  (read-number prompt))))
  (escreen-goto-screen number))

(provide 'init-escreen)
