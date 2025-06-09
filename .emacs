(package-initialize)

; load files
(load-file "~/.emacs.rc/rc.el")
(load-file "~/.emacs.rc/org.el")
(add-to-list 'load-path "~/.emacs.local/")

; set defaults
(setq-default inhibit-splash-screen t
	tab-width 4
	standard-indent 4
	indent-tabs-mode t
	fill-column 80
	tab-always-indent nil
	ring-bell-function 'ignore)

; set variables
(setq custom-file "~/.emacs.custom.el")
(setq inhibit-startup-message t)
(setq company-idle-delay nil)
(setq company-minimum-prefix-length 1)

(setq backup-directory-alist '((".*" . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-saves/" t)))
(setq auto-save-list-file-prefix "~/.emacs.d/auto-saves/.saves-")

; require packages
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(rc/require-theme 'gruber-darker)
(rc/require 'company)
(rc/require 'magit)
(rc/require 'web-mode)
(rc/require 'typescript-mode)
(rc/require 'move-text)
(rc/require 'markdown-mode)
(rc/require 'smex)
(rc/require 'multiple-cursors)
(rc/require 'vue-mode)

; global config
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
(global-company-mode)
(global-display-fill-column-indicator-mode)
(set-frame-font "MonoLisa 15" nil t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq scroll-conservatively 101)
(setq scroll-step 1)
(setq scroll-margin 5)
(setq mmm-submode-decoration-level 0)
(setq js-indent-level 2)
(setq typescript-indent-level 2)
(setq css-indent-offset 2)
(setq sgml-basic-offset 2)

; keymapping
(global-set-key (kbd "M-p")         'move-text-up)
(global-set-key (kbd "M-n")         'move-text-down)
(global-set-key (kbd "M-x")         'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key (kbd "M-/") 'company-complete)

; multiple cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->")         'mc/mark-next-like-this)
(global-set-key (kbd "C-<")         'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<")     'mc/mark-all-like-this)
(global-set-key (kbd "C-\"")        'mc/skip-to-next-like-this)
(global-set-key (kbd "C-:")         'mc/skip-to-previous-like-this)

; editor config
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(ido-mode 1)
(ido-everywhere 1)
(global-display-line-numbers-mode 1)

; formatter
(defun astyle-buffer ()
  (interactive)
  (let ((saved-line-number (line-number-at-pos)))
    (shell-command-on-region
     (point-min)
     (point-max)
     "astyle --style=kr"
     nil
     t)
    (goto-line saved-line-number)))

;;; Whitespace mode
(defun rc/set-up-whitespace-handling ()
  (interactive)
  (whitespace-mode 1)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace))


(defun my-markdown-mode-hook ()
  (setq markdown-font-lock-keywords
        (remove '("_" . 'markdown-underline) markdown-font-lock-keywords)))

(add-hook 'markdown-mode-hook 'my-markdown-mode-hook)

(load-file custom-file)

