(defun buffer-open-dir-in-explorer ()
  (interactive)
  "Opens Windows Explorer in the directory containing the file corresponding to the current buffer"
  (shell-command
   (concat "explorer.exe"
	   " \""
	   (to-windows-path (file-name-directory buffer-file-name))
	   "\"")))

(defun to-windows-path (path)
    "Replaces the unixy forward slashes in a file path with
     the windows-friendly backslash"
    (replace-regexp-in-string "/" "\\\\" path))

(provide 'buffer-open-dir-in-explorer)
