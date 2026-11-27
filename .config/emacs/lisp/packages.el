;; -*- lexical-binding: nil -*- 

(require 'package)

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(require 'use-package)

(setq use-package-always-ensure t)

(use-package emacs
  :custom
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package modus-themes)

(use-package compile
  :ensure nil
  :hook (compilation-filter . ansi-color-compilation-filter)
  :custom
  (compilation-scroll-output 'first-error)
  (compilation-always-kill t)
  :config
  (define-advice compile (:around (orig &rest args) use-project-root)
    (let* ((root (or (and (project-current)
                          (project-root (project-current)))
                     default-directory))
           (fix (lambda (s)
                  (if (and (stringp s)
                           (string-prefix-p "../" s)
                           (file-exists-p (expand-file-name (substring s 3) root))
                           (not (file-exists-p (expand-file-name s root))))
                      (concat "./" (substring s 3))
                    s)))
           (default-directory root)
           (compile-command (if (stringp compile-command)
                                (funcall fix compile-command)
                              compile-command)))
      (apply orig (mapcar fix args))))
  (define-advice compilation-read-command (:around (orig &rest args) use-project-root)
    (let ((default-directory (or (and (project-current)
                                      (project-root (project-current)))
                                 default-directory)))
      (apply orig args))))

(use-package magit
  :custom
  (setq auto-revert-check-vc-info t)
  (global-auto-revert-mode 1))

(use-package consult
  :bind (
         ("C-p" . consult-find)
         ("M-g g" . consult-ripgrep)
         ("C-x b" . consult-buffer)))

(use-package vertico
  :init
  (vertico-mode 1)
  :custom
  (vertico-cycle t))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-file))

(use-package corfu
  :init
  (setq corfu-cycle t)
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.1)
  (setq corfu-auto-prefix 1)
  :config
  (global-corfu-mode)
  :hook
  (eshell-mode . (lambda () (corfu-mode -1))))

(use-package apheleia
  :config
  (add-to-list 'apheleia-mode-alist '(typescript-ts-mode . prettier))
  (add-to-list 'apheleia-mode-alist '(tsx-ts-mode . prettier))
  (add-to-list 'apheleia-mode-alist '(js-ts-mode . prettier))
  (apheleia-global-mode +1))

(use-package treesit
  :ensure nil
  :init
  (setq treesit-language-source-alist
        '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
          (rust "https://github.com/tree-sitter/tree-sitter-rust")))
  :config
  ;; Automatically install missing grammars defined in treesit-language-source-alist
  (dolist (lang '(typescript tsx rust))
    (unless (treesit-ready-p lang t)
      (treesit-install-language-grammar lang))))

(use-package eglot
  :functions (eglot-ensure)
  :commands (eglot)
  :hook (prog-mode . eglot-ensure)
  :bind (:map eglot-mode-map
              ("C-c c a" . eglot-code-actions)
              ("C-c c r" . eglot-rename))
  :config
  (set-face-attribute 'eglot-highlight-symbol-face nil
                      :foreground "#ffd700"
                      :underline t))

(use-package typescript-ts-mode
  :mode (("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :hook (tsx-ts-mode . eglot-ensure)
  :config
  (setq typescript-ts-mode-indent-offset 4))

(use-package rust-ts-mode
  :ensure nil
  :mode ("\\.rs\\'" . rust-ts-mode)
  :hook (rust-ts-mode . eglot-ensure)
  :config
  (setq rust-ts-mode-indent-offset 4))

(use-package zig-mode)

(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode)
         ("\\.cmake\\'" . cmake-mode))
  :custom
  (cmake-tab-width 4))

(use-package dts-mode
  :ensure t
  :mode ("\\.dtsi?\\'" . dts-mode))

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(use-package dired-subtree
  :commands (dired-subtree-toggle dired-subtree-cycle)
  :config
  (setq dired-subtree-line-prefix " ")
  (setq dired-subtree-use-backgrounds nil))
(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar))

(provide 'packages)
