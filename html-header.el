(defun cs-html-header ()
  (interactive)
  (insert
"<html>
  <head>
    <meta charset=\"utf-8\">
    <script src=\"https://d3js.org/d3.v4.min.js\"></script>
  </head>
  <body>
  </body>
</html>
"))

(defun cs-ajax-request ()
  (interactive)
  (insert
"function loadXMLDoc(url, func)
{
    xmlhttp=new XMLHttpRequest();

    function state_Change()
    {
	if (xmlhttp.readyState==4)
	{// 4 = \"loaded\"
	    if (xmlhttp.status==200) {// 200 = \"OK\"
		func()
	    } else {
		alert(\"Problem retrieving data:\" + xmlhttp.statusText);
	    }
	}
    }

    xmlhttp.onreadystatechange=state_Change;
    xmlhttp.open(\"GET\", url, true);
    xmlhttp.send(null);}"))

(defun cs-js-mvc ()
  (interactive)
  (insert
"function OnameModel(){
}

function OnameController(){
}

function OnameView(){
}

var Oname = {
    init: function(g){
	this.nodeg = g;
	OnameModel.call(this);
	OnameController.call(this);
	OnameView.call(this);
    }
}
"))

(defun cs-html-css ()
  (interactive)
  (insert
"<link rel = \"stylesheet\" type = \"text/css\" href = \"\" />"))
