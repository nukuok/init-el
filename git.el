(defun gitc ()
  (interactive)
  (insert
   "git commit -a -m \"[update]\""))

(defun gitp ()
  (interactive)
  (insert
   "git push -u origin master"))

(defun gits ()
  (interactive)
  (insert
   "git status"))

(defun gitb ()
  (interactive)
  (insert
   "git branch"))

(defun gitt ()
  (interactive)
  (insert
   "git tag v"))

(defun gitpt ()
  (interactive)
  (insert
   "git push --tags"))

(defun gitrv ()
  (interactive)
  (insert
   "git remote -v"))

(defun ssh ()
  (interactive)
  (insert
   "cd /ssh:192.168.20.195:~"))

