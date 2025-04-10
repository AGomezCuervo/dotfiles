(package-initialize)

; load files
(load-file "~/.emacs.rc/rc.el")
(load-file "~/.emacs.rc/org.el")

; set variables
(setq custom-file "~/.emacs.custom.el")
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(setq tab-always-indent nil)

(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-saves/" t)))
(setq auto-save-list-file-prefix "~/.emacs.d/auto-saves/.saves-")

; require packages
(rc/require-theme 'gruber-darker)
(rc/require 'company)
(rc/require 'move-text)
(rc/require 'smex)
(rc/require 'multiple-cursors)

; global config
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(global-company-mode)
(set-frame-font "MonoLisa 15" nil t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq scroll-conservatively 101)
(setq scroll-step 1)            
(setq scroll-margin 5)          

; keymapping
(global-set-key (kbd "M-p")         'move-text-up)
(global-set-key (kbd "M-n")         'move-text-down)
(global-set-key (kbd "M-x")         'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-\\")        'Company-complete)

; multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
(global-set-key (kbd "C-,")         'duplicate-line)

; editor config
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(ido-mode 1)
(ido-everywhere 1)
(global-display-line-numbers-mode 1)

;;; Whitespace mode
(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))

(add-hook 'tuareg-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c++-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'c-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'simpc-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'emacs-lisp-mode 'rc/set-up-whitespace-handling)
(add-hook 'java-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'lua-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'rust-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'scala-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'markdown-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'haskell-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'python-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'erlang-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'asm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'fasm-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'go-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'nim-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'yaml-mode-hook 'rc/set-up-whitespace-handling)
(add-hook 'porth-mode-hook 'rc/set-up-whitespace-handling)

(load-file custom-file)
