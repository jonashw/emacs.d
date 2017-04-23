(defun buffer-open-dir-in-msdos ()
  (interactive)
  "Opens MSDOS command window in the directory containing the file corresponding to the current buffer"
  ;;This function body was copied from http://stackoverflow.com/a/13509208/943730
  (let ((proc
	 (start-process "cmd" nil "cmd.exe" "/c" "start" "cmd.exe")))
    ;;We don't want CMD to be bothered when we close emacs (we can't kill it anyway)
    (set-process-query-on-exit-flag proc nil)))

(provide 'buffer-open-dir-in-msdos)
