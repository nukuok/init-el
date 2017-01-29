(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq make-backup-files nil)
(setq auto-save-default nil)


;;(add-to-list 'load-path "~/.emacs.d/emacs-flymake-cursor")
;;(add-to-list 'load-path "~/.emacs.d/elpa/org-20160425/")
(setenv "PATH" (concat  "/usr/local/bin/:" (getenv "PATH")))

(setq visible-bell nil)
(put 'upcase-region 'disabled nil)

(require 'linum)
(global-linum-mode t)

(defun export-lang1 ()
  (interactive)
  (insert
   "export LC_ALL=en_US.UTF-8"))

(defun export-lang2 ()
  (interactive)
  (insert
   "export LANG=en_US.UTF-8"))

(defun cs-insert-template ()
  (interactive)
  (insert
"(defun  ()
  (interactive)
  (insert
\"\"))"
))

(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
;;                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)
(put 'erase-buffer 'disabled nil)

(defun cs-today ()
  (interactive)
  (insert (format-time-string "%Y%m%d")))

(defun cs-find ()
  (interactive)
  (insert
"find ./ -type f | xargs grep "))
