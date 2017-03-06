(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'load-path "~/.emacs.d/lisp")

(setq default-buffer-file-coding-system 'euc-jp)
(prefer-coding-system 'euc-jp)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; (add-to-list 'load-path "/home/nukuok/.emacs.d/slime-2.15/")
;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; (require 'slime)
;; (require 'slime-autoloads)
;; (slime-setup '(slime-fancy))
;; (add-hook 'lisp-mode-hook (lambda ()
;; 			    (slime-mode t)
;; 			    (show-paren-mode)))

(global-linum-mode t)



;;(setq make-backup-files nil)
;; (org-babel-do-load-languages
;;  'org-babel-load-languages
;;  '((lisp . t)))

(load-file "~/.emacs.d/init-el/emacs-config.el")
(load-file "~/.emacs.d/init-el/auto-mode.el")
(load-file "~/.emacs.d/init-el/kbd.el")
(load-file "~/.emacs.d/init-el/git.el")
(load-file "~/.emacs.d/init-el/d3js.el")

(defun split-window-and-run-shell ()
  (progn
    (setq w (selected-window))
    (setq w2 (split-window w nil t))
    (setq w3 (split-window-below))
    (command-execute 'balance-windows)
    (select-window w)
;    (term "/bin/bash")
    (eshell)
    (select-window w2)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 ;; '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(custom-enabled-themes (quote (wheatgrass)))
 '(flymake-python-pyflakes-extra-arguments
   (quote
    ("--max-line-length=129" "--ignore=E124" "--ignore=E126" "--ignore=E128")))
 ;; '(org-export-with-sub-superscripts (quote {})) 20170306
 '(package-selected-packages
   (quote
    (web-mode scala-mode slime ox-gfm markdown-mode flymake-python-pyflakes elpy dictionary ace-link)))
 '(show-paren-mode t))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 90 :width normal)))))


(add-hook 'after-init-hook (lambda () (split-window-and-run-shell)))
