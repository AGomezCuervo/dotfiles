(package-initialize)

; load files
(load-file "~/.emacs.rc/rc.el")
(load-file "~/.emacs.rc/org.el")

; set variables
(setq custom-file "~/.emacs.custom.el")
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)

(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-saves/" t)))
(setq auto-save-list-file-prefix "~/.emacs.d/auto-saves/.saves-")

; require packages
(rc/require-theme 'gruber-darker)
(rc/require 'company)
(rc/require 'smex)
(rc/require 'multiple-cursors)

; global config
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(global-company-mode)
(set-frame-font "MonoLisa 15" nil t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

; keymapping
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)
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

(load-file custom-file)
