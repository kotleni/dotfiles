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
  (compilation-always-kill t))

(use-package magit)

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

(use-package consult
  :bind (
         ("C-p" . consult-find)
         ("M-g g" . consult-ripgrep)
         ("C-x b" . consult-buffer)))

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
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))
  :config
  ;; Automatically install missing grammars defined in treesit-language-source-alist
  (dolist (lang '(typescript tsx))
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

(use-package zig-mode)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(provide 'packages)
