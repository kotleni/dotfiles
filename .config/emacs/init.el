(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'binds)
(require 'startup-screen)
(require 'packages)
(require 'elcord)

;; enable & configure elcord
(elcord-mode)
(setq elcord-refresh-rate 15)
(setq elcord-idle-timer 600)
(setq elcord-idle-message "Digging a hole...")
(setq elcord-quiet t)
(setq elcord-display-buffer-details t)
(setq elcord-display-line-numbers nil)

(setq inhibit-startup-screen t)

;; font
(add-to-list 'default-frame-alist
             '(font . "Iosevka Nerd Font Mono"))

;; visual
(load-theme 'modus-vivendi)
(setopt
 inhibit-startup-screen t
 initial-buffer-choice #'render-startup-screen ;; from lisp/startup-screen.el
 initial-scratch-message nil
 menu-bar-mode nil
 tool-bar-mode nil
 scroll-bar-mode nil
 use-dialog-box nil
 ring-bell-function #'ignore
 cursor-type 'bar
 tab-bar-show nil
 tab-bar-close-button-show nil)

;; line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; use 4-spaces indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default comment-column 4)

;; force tab to insert 4-spaces instead of syntax based insertion 
;; (global-set-key (kbd "TAB") (lambda () (interactive) (insert-char ?\s 4)))

;; auto-reload changed files from disk 
(global-auto-revert-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
