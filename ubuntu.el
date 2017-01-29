(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/.emacs.d/lisp")
(split-window-right)

;;(add-hook 'after-init-hook 'ibus-mode-on)
;;(setq ibus-cursor-color '("red" "blue" "limegreen"))
;;(ibus-define-common-key ?\C-j t)

(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;;(setq load-path (cons (expand-file-name "/usr/share/emacs23/site-lisp/yatex") load-path))

(setq default-buffer-file-coding-system 'euc-jp)
(prefer-coding-system 'euc-jp)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;(add-to-list 'load-path "/home/nukuok/.emacs.d/slime-2.15/contrib/")
(add-to-list 'load-path "/home/nukuok/.emacs.d/slime-2.15/")
(setq inferior-lisp-program "/usr/bin/sbcl")
;;(package-initialize)
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
(add-hook 'lisp-mode-hook (lambda ()
			    (slime-mode t)
			    (show-paren-mode)))

(global-linum-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))


;;(setq make-backup-files nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)))

(load-file "~/.emacs.d/init-el/emacs-config.el")
(load-file "~/.emacs.d/init-el/auto-mode.el")
(load-file "~/.emacs.d/init-el/kbd.el")
(load-file "~/.emacs.d/init-el/git.el")
(load-file "~/.emacs.d/init-el/d3js.el")
