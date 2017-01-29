(setq auto-mode-alist 
      (cons (cons "\\.tex" 'yatex-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

(setq auto-mode-alist
  (append
   '(("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . web-mode)
     ("\\.mm\\'" . c++-mode))
   auto-mode-alist))

