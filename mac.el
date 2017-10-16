(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "monospace" :foundry "outline" :slant normal :weight normal :height 120 :width normal))))
 '(cursor ((((class color) (background dark)) (:background "#00AA00")) (((class color) (background light)) (:background "#999999")) (t nil))))

(require 'cl)
(require 'package)

(add-to-list 'package-archives
       '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(elpy))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(require 'ox-gfm)
(require 'ox-textile)

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

(add-hook 'after-init-hook (lambda () (split-window-and-run-shell)))

(load-file "~/.emacs.d/init-el/emacs-config.el")
(load-file "~/.emacs.d/init-el/auto-mode.el")
(load-file "~/.emacs.d/init-el/d3js.el")
(load-file "~/.emacs.d/init-el/python.el")
(load-file "~/.emacs.d/init-el/cl.el")
(load-file "~/.emacs.d/init-el/org-mode.el")
(load-file "~/.emacs.d/init-el/git.el")
(load-file "~/.emacs.d/init-el/kbd.el")
(load-file "~/.emacs.d/init-el/html-header.el")



;;(require 'eww-customize)
;;(require 'ace-link-customize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (wheatgrass)))
 '(flymake-python-pyflakes-extra-arguments
   (quote
    ("--max-line-length=129" "--ignore=E124" "--ignore=E126" "--ignore=E128")))
 '(org-export-with-sub-superscripts (quote {}))
 '(package-selected-packages
   (quote
    (web-mode scala-mode slime ox-gfm markdown-mode flymake-python-pyflakes elpy dictionary ace-link)))
 '(show-paren-mode t))

;; (add-hook 'java-mode-hook 'flymake-mode-on)
;; (defun my-java-flymake-init ()
;;   (list "javac" (list (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-with-folder-structure))))
;; (add-to-list 'flymake-allowed-file-name-masks '("\\.java$" my-java-flymake-init flymake-simple-cleanup))

(add-to-list 'default-frame-alist '(fullscreen . maximized))


;;(require 'ox-publish)
;;(setq org-publish-project-alist
;;      '(
;;        ("html"
;;         :publishing-directory "./html/"
;;         :recursive t
;;         :publishing-function org-html-publish-to-html
;;         :headline-levels 4             ; Just the default for this project.
;;         :auto-preamble t
;;         )
;;        ("all" :components ("html" "pdf")) ))


;; roswell
;;(load (expand-file-name "~/.roswell/impls/ALL/ALL/quicklisp/slime-helper.el"))
;;(setq inferior-lisp-program "ros -L sbcl -Q run")

;; (setf slime-lisp-implementations
;;       `((sbcl    ("sbcl" "--dynamic-space-size" "2000"))
;;         (roswell ("ros" "dynamic-space-size=2000" "-Q" "-l" "~/.sbclrc" "run"))))
;; (setf slime-default-lisp 'roswell)
;; (setq inferior-lisp-program "ros -L sbcl -Q -l ~/.sbclrc run")

;; (defun error-format ()
;;   (interactive)
;;   (insert
;;    "###
;; - エラー内容:

;; - エラー事象:

;; - 対処:

;; - 推測エラー原因:
;; "))




(defun my-dictionary-search ()
  (interactive)
  (let ((word (current-word))
	(enable-recursive-minibuffers t)
	(val))
    (setq val (read-from-minibuffer
	       (concat "Word"
		       (when word
			 (concat " (" word ")"))
		       ": ")))
    (dictionary-new-search
     (cons (cond
	    ((and (equal val "") word)
	     word)
	    ((> (length val) 0)
	     val)
	    (t
	     (error "No word to lookup")))
	   dictionary-default-dictionary))))

;; (use-package markdown-mode
;; 	     :ensure t
;; 	     :commands (markdown-mode gfm-mode)
;; 	     :mode (("README\\.md\\'" . gfm-mode)
;; 		    ("\\.md\\'" . markdown-mode)
;; 		    ("\\.markdown\\'" . markdown-mode))
;; 	     :init (setq markdown-command "multimarkdown"))

;; var drag = d3.drag()
;;     .on("drag", function(d,i) {
;; 	if (typeof(d.transform) == "undefined"){
;; 	    d.transform = {};
;; 	    d.transform.x = 0;
;; 	    d.transform.y = 0;
;; 	}
;;         d.transform.x += d3.event.dx;
;;         d.transform.y += d3.event.dy;
;;         d3.select(this).attr("transform", function(d,i){
;;             return "translate(" + [ d.transform.x,d.transform.y ] + ")"
;;         })
;; });

;; .text(function(d){ return d.hostname; })
;; .call(drag)

;; https://github.com/purcell/exec-path-from-shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; (exec-path-from-shell-copy-env "PYTHONPATH")

(desktop-save-mode 1)

(if (require 'toc-org nil t)
    (add-hook 'org-mode-hook 'toc-org-enable)
  (warn "toc-org not found"))

(add-hook 'c-mode-common-hook 'google-set-c-style)
