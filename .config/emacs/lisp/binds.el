(global-set-key (kbd "C-c e") 'eshell)
(global-set-key (kbd "C-c r r") 'recompile)
(global-set-key (kbd "C-c r c") 'compile)

(defun kotleni/duplicate-line ()
  "Duplicate current line"
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
                (if s (string-remove-suffix "\n" s) ""))))
    (move-end-of-line 1)
    (newline)
    (insert line)
    (move-beginning-of-line 1)
    (forward-char column)))

(global-set-key (kbd "C-,") 'kotleni/duplicate-line)

(provide 'binds)
