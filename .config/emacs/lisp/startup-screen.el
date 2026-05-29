(defvar startup-ascii-art-path "~/.config/emacs/startup-art.txt"
  "Path to the plain text file containing ASCII art.")

(defun render-startup-screen ()
  "Render startup screen."
  (let ((buf (get-buffer-create "*dashboard*")))
    (with-current-buffer buf
      (read-only-mode -1)
      (erase-buffer)
      (setq-local cursor-type nil)
;      (setq-local mode-line-format nil)
      
      (if (file-exists-p startup-ascii-art-path)
          (insert-file-contents startup-ascii-art-path)
        (insert "    Failed to load startup-art.txt!\n")) ; Fallback string
      (insert "\n")
      
      (goto-char (point-min))
      (read-only-mode 1))
    buf))

; startup performance metrics
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

(provide 'startup-screen)
