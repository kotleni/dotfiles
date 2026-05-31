(defvar theme-light 'modus-operandi)
(defvar theme-dark 'mobus-vivendi)

(defun apply-theme (mode)
  "Switch Emacs theme based on system MODE"
  (cond
     ((eq mode 'light) (load-theme theme-light t))
     ((eq mode 'dark)  (load-theme theme-dark t))))

(defun sync-system-theme ()
  "Sync theme to defined by gtk"
  (let ((gsettings-mode (shell-command-to-string "gsettings get org.gnome.desktop.interface color-scheme")))
    (if (string-match-p "prefer-dark" gsettings-mode)
        (apply-theme 'dark)
      (apply-theme 'light))))

;; Auto sync theme on load
(sync-system-theme)

(defun sync-theme ()
  "Sync theme via command"
  (interactive)
  (sync-system-theme))

(provide 'theme)
