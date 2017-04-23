(menu-bar-mode 0)

(tool-bar-mode 0)
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lib")
;;
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
;;
(defun edit-init ()
  "Opens my emacs init file for editing."
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "C-c e") 'edit-init)
;;
(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(global-set-key (kbd "C-c p i") 'package-install)

;;
(setq default-tab-width 4)
(global-linum-mode 1)
(column-number-mode 1)
;;
(require 'init-super-and-hyper)
(require 'init-neotree)
(require 'init-yasnippet)
(require 'init-helm)
(require 'init-evil)
(require 'init-haskell-mode)
(require 'init-dired)
(require 'init-hydra)
(require 'init-html-mode)
(require 'init-hydra-buffer-menu)
(require 'init-hydra-accent-letters)
(require 'init-smartparens)
(require 'init-escreen)
(require 'init-sql-mode)
(global-set-key (kbd "C-c a") 'hydra-accent-letters/body)
(require 'init-ido)
(require 'init-fonts)
(global-set-key (kbd "C-c f") 'hydra-default-font/body)

(require 'which-key)
(which-key-mode)
;;(which-key-setup-side-window-right)
;;(which-key-setup-side-window-bottom)
(which-key-setup-side-window-right-bottom)

;;(require 'company-mode)
(company-mode)
(global-set-key (kbd "C-SPC")   'company-complete)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define global-map "bm" 'buffer-menu)
(key-chord-define global-map "sb" 'switch-to-buffer)
(key-chord-define global-map "bj" 'bookmark-jump)
(define-key global-map (kbd "C-s") 'save-buffer) ;;Note: masks isearch

(setq require-final-newline nil)

(require 'buffer-open-dir-in-explorer)
(require 'buffer-open-dir-in-msdos)
(define-key global-map (kbd "M-e") 'buffer-open-dir-in-explorer)
(define-key global-map (kbd "M-c") 'buffer-open-dir-in-msdos)

(require 'describe-foo-at-point)
(require 'eval-and-replace)
(define-key emacs-lisp-mode-map [(f1)] 'describe-foo-at-point)
(define-key emacs-lisp-mode-map (kbd "C-c C-e") 'eval-and-replace)

;;Appearance
(load-theme 'material t)
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;;Keep all the backup files in one place!
(setq backup-directory-alist '(("." . "~/.emacs.backups")))

(defun replace-in-string (what with in)
  (replace-regexp-in-string (regexp-quote what) with in nil 'literal))

;;Allow undo/redo to changes in window configuration
(when (fboundp 'winner-mode)
      (winner-mode 1))


(require 'subr-x)
(require 'evil)
(defun reverse-current-line ()
  "reverses the contents of the current line"
  (interactive)
  (let ((str (thing-at-point 'line t)))
	(kill-whole-line)
	(evil-open-above 1)
	(insert (string-reverse str))))

(require 'expand-region)
(define-key evil-normal-state-map (kbd "SPC e") 'er/expand-region)

(defun copy-full-path-to-kill-ring ()
  "copy buffer's full path to kill ring"
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))))

;; Make align and align-regexp use spaces instead of tabs
(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))
(defadvice align (around align-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))
(defun align-comma ()
  "aligns the selected region into comma-delimited columns.
The command accounts for any whitespace leading or trailing the commas,
so it can be excuted multiple times on a region idempotently.

For example, the following JavaScript:
		{Id:'ExhibitorGrade',Orderable:true,Label:'Exhibitor Grade'},         
		{Id:'ExhibitorName',Orderable:true,Label:'Exhibitor Name'}, 
		{Id:'ExhibitorNumber',Orderable:true,Label:'Exhibitor Number'},        
		{Id:'ExhibitorParentNames',Orderable:true,Label:'Exhibitor Parent Names'},   
		{Id:'BlankPlacing',Orderable:false,Label:'Placing (Blank)'},         
		{Id:'BlankRibbon',Orderable:false,Label:'Ribbon (Blank)'},          
		{Id:'BlankAward',Orderable:false,Label:'Award (Blank)'},           
		{Id:'SaleParticipationType',Orderable:false,Label:'Sale Participation'}

Would be transformed into:
		{Id:'ExhibitorGrade',        Orderable:true,  Label:'Exhibitor Grade'},         
		{Id:'ExhibitorName',         Orderable:true,  Label:'Exhibitor Name'}, 
		{Id:'ExhibitorNumber',       Orderable:true,  Label:'Exhibitor Number'},        
		{Id:'ExhibitorParentNames',  Orderable:true,  Label:'Exhibitor Parent Names'},   
		{Id:'BlankPlacing',          Orderable:false, Label:'Placing (Blank)'},         
		{Id:'BlankRibbon',           Orderable:false, Label:'Ribbon (Blank)'},          
		{Id:'BlankAward',            Orderable:false, Label:'Award (Blank)'},           
		{Id:'SaleParticipationType', Orderable:false, Label:'Sale Participation'}"
  (interactive)
  (align-regexp
   (region-beginning)
   (region-end)
   "\\(\\s-*,\\s-*\\)" ;; regexp (This matches optional whitespace that leads/trails each comma.)
   1 ;; group to modify (I am not sure what this means..)
   2 ;; amount of spacing (I use 2 instead of 1 to get a space *after* each comma, which looks nicer.)
   t ;; repeat throughout line (I will typically have more than 2 columns.)
   ))
