(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'binds)
(require 'startup-screen)
(require 'elcord)

; enable & configure elcord
(elcord-mode)
(setq elcord-refresh-rate 15)
(setq elcord-idle-timer 600)
(setq elcord-idle-message "Idle... >.<")
(setq elcord-quiet t)
(setq elcord-display-buffer-details t)
(setq elcord-display-line-numbers nil)

(setq inhibit-startup-screen t)

; font
(add-to-list 'default-frame-alist
             '(font . "Iosevka Nerd Font Mono"))

; visual
(load-theme 'modus-vivendi)
(setopt
 inhibit-startup-screen t
 initial-buffer-choice #'render-startup-screen ; from lisp/startup-screen.el
 initial-scratch-message nil
 menu-bar-mode nil
 tool-bar-mode nil
 scroll-bar-mode nil
 use-dialog-box nil
 ring-bell-function #'ignore
 cursor-type 'bar
 tab-bar-show nil
 tab-bar-close-button-show nil)

; line numbers
(display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

; use 4-spaces indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

; force tab to insert 4-spaces instead of syntax based insertion 
; (global-set-key (kbd "TAB") (lambda () (interactive) (insert-char ?\s 4)))

; auto-reload changed files from disk 
(global-auto-revert-mode 1)
