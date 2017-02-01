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
