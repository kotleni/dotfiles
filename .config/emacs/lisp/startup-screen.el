;; https://github.com/emacs-dashboard/dashboard

(setq dashboard-banner-logo-title "Welcome to Emacs")
(setq dashboard-startup-banner 'logo-braille)
(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)
(setq dashboard-show-shortcuts nil)
(setq dashboard-items '((recents   . 5)
                        (bookmarks . 5)
                        (projects  . 5)))

(setq dashboard-footer-messages '("Here to do customizing, or actual work?"
                                  "M-x insert-inspiring-message"
                                  "My software never has bugs. It just develops random features."
                                  "Dad, what are clouds made of? Linux servers, mostly."
                                  "Also try VIM!"
                                  "There is no place like ~"
                                  "Made with care for femboys."
                                  "I showed you my source code, plz respond."
                                  "While any text editor can save your files, only Emacs can save your soul."
                                  "I’ll tell you a DNS joke but it could take 24 hours for everyone to get it."
                                  "I'd tell you a UDP joke, but you might not get it."
                                  "I'll tell you a TCP joke. Do you want to hear it?"))

;; startup performance metrics
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(provide 'startup-screen)
