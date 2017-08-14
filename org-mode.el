(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2017.13/libexec/plantuml.jar")

(defun org-mode-init ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   (add-to-list 'org-babel-load-languages '(plantuml . t))))

(add-hook 'org-mode-hook
          (lambda () (face-remap-add-relative 'default :family "Monospace")))
(add-hook 'org-mode-hook 'org-mode-init)

(fset 'src
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("#+BEGIN_SRC

#+END_SRC" 0 "%d")) arg)))

(defun cs-src ()
  (interactive)
  (insert
"#+BEGIN_SRC text

#+END_SRC"))

(defun cs-srcm ()
  (interactive)
  (insert
"#+BEGIN_SRC text
```

```
#+END_SRC")
  (dotimes (number 23)
    (backward-char)))

(defun cs-orgheader ()
  (interactive)
  (insert
"#+TITLE:
#+OPTIONS: html-postamble:nil
#+HTML_HEAD: <style>
#+HTML_HEAD: table {border-right: 1px solid black; border-left: 1px solid black;font-family: monospace;}
#+HTML_HEAD: td {width: 300px; border-right: 1px solid black; border-left: 1px solid black}
#+HTML_HEAD: td {padding-top: 1px; padding-bottom: 1px; padding-left: 5px; padding-right: 5px}
#+HTML_HEAD: th {text-align: left}
#+HTML_HEAD: th {width: 300px; border-right: 1px solid black; border-left: 1px solid black}
#+HTML_HEAD: tr {border: 0px}
#+HTML_HEAD: </style>
"))

(defun cs-orgimg ()
  (interactive)
  (insert
"#+BEGIN_SAMPLE
#+attr_html: :width px
[[file:]]
#+END_SAMPLE"))

(defun cs-orguml ()
  (interactive)
  (insert
"#+BEGIN_SRC plantuml :file .png :cmdline -charset UTF-8
skinparam shadowing false
skinparam monochrome true

#+END_SRC
")
  (dotimes (number 92)
    (backward-char)))
