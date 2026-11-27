;; -*- lexical-binding: nil -*- 

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'binds)
(require 'packages)
(require 'elcord)
(require 'startup-screen)
(require 'theme)
;; (require 'simpc-mode)

;; Forse modes by file extention
;; (add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; emacs generated code
(setq custom-file (expand-file-name "generated.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; trusted folders
(setq trusted-content '("~/Projects/"))

;; TODO: Use expand-file-name for path's
;; set backups and autosave folders
(setq backup-directory-alist `(("." . ,(expand-file-name "backups/" user-emacs-directory))))
(setq auto-save-file-name-transforms `((".*" ,(expand-file-name "auto-save/" user-emacs-directory) t)))
(dolist (dir (list (expand-file-name "backups/" user-emacs-directory) (expand-file-name "auto-save/" user-emacs-directory)))
  (unless (file-directory-p dir)
    (make-directory dir t)))

;; enable & configure elcord
(elcord-mode)
(setq elcord-refresh-rate 15)
(setq elcord-idle-timer 2600)
(setq elcord-idle-message "Idling...")
(setq elcord-quiet t)
(setq elcord-display-buffer-details t)
(setq elcord-display-line-numbers nil)

(setq inhibit-startup-screen t)

;; font
(defun kotleni/font-by-resolution ()
  (let ((w (ignore-errors (display-pixel-width)))
        (h (ignore-errors (display-pixel-height))))
    (if (and (numberp w) (numberp h) (= w 1920) (= h 1080))
        "CaskaydiaCove Nerd Font-10"
      "CaskaydiaCove Nerd Font-12")))

(let ((f (kotleni/font-by-resolution)))
  (add-to-list 'default-frame-alist `(font . ,f))
  (when (display-graphic-p)
    (set-face-attribute 'default nil :font f)))

(add-hook 'after-make-frame-functions
          (lambda (frame)
            (with-selected-frame frame
              (when (display-graphic-p frame)
                (set-face-attribute 'default nil :font (kotleni/font-by-resolution))))))

;; visual
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

