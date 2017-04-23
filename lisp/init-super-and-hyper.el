;; Super and Hyper modifiers!
(setq
 w32-pass-apps-to-system nil
 w32-apps-modifier 'super
 ;;Unfortunately, I cannot get the Windows key to bind 
 ;;w32-pass-lwindow-to-system nil
 ;;w32-pass-rwindow-to-system nil
 ;;w32-lwindow-modifier 'hyper ;; Left Windows key
 ;;w32-rwindow-modifier 'hyper ;; Right Windows key
 )
(defun super-thanks ()
  (interactive)
  (message "Thanks for using the Super key"))
(define-key global-map (kbd "s-c m") 'super-thanks)
(define-key global-map (kbd "s-m") 'super-thanks)

(provide 'init-super-and-hyper)
