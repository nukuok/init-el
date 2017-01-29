(defun cs-d3-identity ()
  (interactive)
  (insert
   "function(d){return d;}"))

(defun cs-d3-di ()
  (interactive)
  (insert
   "function(d,i){}"))

(defun cs-d3-add-svg ()
  (interactive)
  (insert
   "var svg = d3.select(\"body\")
    .append(\"svg\")
    .attr(\"width\", 800)
    .attr(\"height\", 600)"))

