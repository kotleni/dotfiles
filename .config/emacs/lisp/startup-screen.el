;; https://github.com/emacs-dashboard/dashboard

(setq dashboard-banner-logo-title "Welcome to Emacs")
(setq dashboard-startup-banner 'logo-braille)
(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)
(setq dashboard-show-shortcuts nil)
(setq dashboard-items '((recents   . 5)
                        (bookmarks . 5)
                        (projects  . 5)))

;; startup performance metrics
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(provide 'startup-screen)
