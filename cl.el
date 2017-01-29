(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/slime")

(require 'slime)
(require 'slime-autoloads)

(setq inferior-lisp-program "/Users/ko_yoyo/Languages/ccl/dx86cl64")
;;(setq inferior-lisp-program "/usr/local/bin/abcl")

(slime-setup '(slime-fancy))
(add-hook 'lisp-mode-hook (lambda ()
       (slime-mode t)
       (show-paren-mode)))

(defun cs-insert-roswell-header ()
  (interactive)
  (insert
"#!/bin/sh
#|-*- mode:lisp -*-|#
#|
exec ros -Q -- $0 \"$@\"
|#
"))

(defun cs-irh ()
  (interactive)
  (insert-roswell-header))

(defun cl-header ()
  (interactive)
  (insert
"(load \"/Users/ko_yoyo/quicklisp/setup.lisp\")
(ql:quickload '(:custom-tools))

(defpackage :
  (:use :cl :cl-user)
  (:export :))

(in-package : )"))

(defun cs-load-ql ()
  (interactive)
  (insert
   "(load \"/Users/ko_yoyo/quicklisp/setup.lisp\")
(ql:quickload )

(defpackage :
  (:use :cl ))

(in-package : "))
