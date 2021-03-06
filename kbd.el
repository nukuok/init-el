(global-set-key (kbd "C-c j")  'windmove-left)
(global-set-key (kbd "C-c k")  'windmove-down)
(global-set-key (kbd "C-c i")    'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c r") 'indent-region)

(defun cs-yank-pop-forward ()
  (interactive)
  (yank-pop -1))
(global-set-key (kbd "M-u") 'cs-yank-pop-forward)

;; Unbind Pesky Sleep Button
(global-unset-key [(control z)])
(global-unset-key [(control x)(control z)])

(fset 'to-scratch
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 98 42 115 99 114 97 116 99 104 42 return] 0 "%d")) arg)))

(global-set-key (kbd "C-c s") 'to-scratch)

(defun insert-backslash ()
  (interactive)
  (insert "\\"))

(global-set-key (kbd "C-c _") 'insert-backslash)

(fset 'remove-space
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\240" 0 "%d")) arg)))

(global-set-key (kbd "C-c SPC") 'remove-space)

(defun cs-kb ()
  (interactive)
  (kill-some-buffers (remove-if '(lambda (x) (or (string-prefix-p "*" (format-message "%s" x))
                                                 (string-prefix-p " " (format-message "%s" x)))) (buffer-list))))

(fset 'cs-ul-to-md
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 60 117 108 1 0 19 47 117 108 5 134217847 14 1 3 106 19 35 120 97 48 134217826 2 2 25 0 67108918 6 23 14 1 3 108] 0 "%d")) arg)))
