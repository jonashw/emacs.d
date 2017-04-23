(require 'sql-indent)

(defun my-sql-mode-hook ()
  (load-library "sql-indent")
  (define-key evil-normal-state-map (kbd "SPC s") 'hydra-sql-mode/body)
  (add-hook 'hack-local-variables-hook
			;; This is an attempt to make sql-mode TABs behave "normally".
			;; Source: http://emacs.stackexchange.com/a/13921 
			(lambda ()
			  (setq indent-tabs-mode nil)
			  (setq tab-width 4)
			  (message "my sql mode!"))
			nil t))

(add-hook 'sql-mode-hook 'my-sql-mode-hook)

(defhydra hydra-sql-mode (:color blue)
   "SQL"
   ("i" hydra-sql-mode-indent/body "indent")
   ("u" upcase-sql-keywords "upcase keywords")
   ("q" nil "cancel"))

(defhydra hydra-sql-mode-indent (:color blue)
   "SQL"
   ("b" sql-indent-buffer "buffer")
   ("s" sql-indent-string "string")
   ("q" nil "cancel"))

(require 'expand-region)
(defun sql-indent-string ()
  "Indents the string under the cursor as SQL."
  ;; Copied from http://stackoverflow.com/a/24659949/943730 
  (interactive)
  (save-excursion
    (er/mark-inside-quotes)
    (let* ((text (buffer-substring-no-properties (region-beginning) (region-end)))
           (pos (region-beginning))
           (column (progn (goto-char pos) (current-column)))
           (formatted-text (with-temp-buffer
                             (insert text)
                             (delete-trailing-whitespace)
                             (sql-indent-buffer)
                             (replace-string "\n" (concat "\n" (make-string column (string-to-char " "))) nil (point-min) (point-max))
                             (buffer-string))))
      (delete-region (region-beginning) (region-end))
      (goto-char pos)
      (insert formatted-text))))

(defun upcase-sql-keywords ()
  (interactive)
  (save-excursion
	(dolist (keywords sql-mode-ms-font-lock-keywords)
	  (goto-char (point-min))
	  (while (re-search-forward (car keywords) nil t)
		(goto-char (+ 1 (match-beginning 0)))
		(when (eql font-lock-keyword-face (face-at-point))
		  (backward-char)
		  (upcase-word 1)
		  (forward-char))))))

(provide 'init-sql-mode)

