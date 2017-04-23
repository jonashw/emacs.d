(add-hook 'html-mode-hook
		  (lambda()
			"Use indentation of 4 spaces instead of 2 (the default)"
			(setq sgml-basic-offset 4)
			(setq indent-tabs-mode t)))

(provide 'init-html-mode)
