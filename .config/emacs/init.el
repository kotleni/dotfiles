(load "~/.config/emacs/lisp/binds.el")

(setq inhibit-startup-screen t)

; visual
(load-theme 'modus-vivendi)
(setopt
 inhibit-startup-screen t
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
