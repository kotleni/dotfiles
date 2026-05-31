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

(use-package compile
  :ensure nil
  :custom
  (compilation-scroll-output 'first-error)
  (compilation-always-kill t)
  :config
  ;; Force color support in compilation buffers
  (add-hook 'compilation-filter-hook 'ansi-color-compilation-filter))

(use-package magit)

(use-package corfu
  :init
  (setq corfu-cycle t)
  (setq corfu-auto t)
  :config
  (global-corfu-mode))

(use-package apheleia
  :config
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

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))

(provide 'packages)
