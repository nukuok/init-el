(defun cs-lisp-canvas-template ()
  (interactive)
  (insert
"(ql:quickload :cl-who)
(ql:quickload :parenscript)
(defpackage :canvas-tutorial
  (:use :cl :cl-who :parenscript))
(in-package :canvas-tutorial)

(with-open-file
    (out \"html/tutorial-0x.html\" :direction :output
         :if-does-not-exist :create :if-exists :supersede)
  (with-html-output (out nil :prologue t :indent t)
    (:html
     (:head
      (:meta :charset \"utf-8\")
      (:script :type \"application/javascript\"
               (str (ps
                     (defun draw ()

     (:body :onload \"draw();\"
      (:canvas :id \"canvas\" :width 150 :height 150)))))"))

(defun cs-lct ()
  (interactive)
  (lisp-canvas-template))
