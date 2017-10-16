(elpy-enable)
(elpy-use-ipython "/usr/local/bin/ipython3")
(add-to-list 'load-path "~/.emacs.d/python-mode")

(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(setq flymake-python-pyflakes-executable "/usr/local/bin/flake8")

(defun export-pypath ()
  (interactive)
  (insert
"export PYTHONPATH=/Users/ko_yoyo/commonscripts/python"))

(fset 'cs-pyutf
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("# -*- coding: utf-8 -*-
" 0 "%d")) arg)))

(defun cs-py-path ()
  (interactive)
  (insert
   "import sys\nsys.path.append('/Users/ko_yoyo/Desktop/program/python/20160830-scripts/')"))

(defun cs-py-main ()
  (interactive)
  (insert
"if __name__ == '__main__':
    "))

(defun cs-py-unittest ()
  (interactive)
  (insert
"import unittest
from unittest.mock import patch
from unittest.mock import Mock

class Test_____(unittest.TestCase):
    def setUp(self):
        new_sysmodules = sys.modules.copy()
        new_sysmodules[''] = Mock()
        self.patcher = patch.dict(sys.modules, new_sysmodules)
        self.patcher.start()

    def tearDown(self):
        self.patcher.stop()

    @patch('', return_value=)
    def test____():
        pass
"))

(defun cs-py-webserver ()
  (interactive)
  (insert
"if __name__ == '__main__':
    from wsgiref.simple_server import make_server

    port = 8888
    server = make_server('', port, application)
    print(\"Serving on port %d\" % port)
    server.serve_forever()
"))

(defun cs-py-ajax-response ()
  (interactive)
  (insert
"    start_response(\"200 OK\", [('Access-Control-Allow-Origin', 'null'),
                              ('Content-Length', '4')
                              ])
    return [b'txt2']
"))

(defun cs-py-np ()
  (interactive)
  (insert
"import numpy as np
"))

(defun cs-py-pd ()
  (interactive)
  (insert
"import pandas as pd
"))

(defun cs-py-tf ()
  (interactive)
  (insert
"import tensorflow as tf
"))

(defun cs-py-sps ()
  (interactive)
  (insert
"import scipy.sparse as sps
"))

(defun cs-py-plt ()
  (interactive)
  (insert
"import matplotlib.pyplot as plt"))

(defun cs-py-realpath ()
  (interactive)
  (insert
"os.path.dirname(os.path.realpath(__file__))"))

(defun cs-py-dokuten ()
  (interactive)
  (insert
"unicodedata.normalize('NFC', )"))

(defun cs-py-httprequest ()
  (interactive)
  (insert
"import urllib.request
h = urllib.request.urlopen("").read()"))

(defun cs-py-readfile ()
  (interactive)
  (insert
"from pathlib import Path
Path('index2.html').read_text()"))

(defun cs-py-jsonload ()
  (interactive)
  (insert
"import json

with open('') as fid:
    data = json.load(fid)"))

(defun cs-py-profile ()
  (interactive)
  (insert
   "import cProfile
cProfile.run('')"))

(defun cs-py-xml ()
  (interactive)
  (insert
"import urllib.request
import xml.etree.ElementTree as ET

def get_xml_from_url(url):
    response = urllib.request.urlopen(request_url).read()

    save_xml = 'versions.xml'
    with open(save_xml, 'w') as fid:
        fid.write(response.decode())

    tree = ET.parse(save_xml)
    root = tree.getroot()

    return root"))

(defun cs-py-chmod ()
  (interactive)
  (insert
"import os
import stat

st = os.stat('somefile')
os.chmod('somefile', st.st_mode | stat.S_IEXEC)"))


(defun cs-py-register-class-method ()
  (interactive)
  (insert
"def register_in_globals(function):
    def mame(class_instance, *args, **kwargs):
        class_instance.__getattribute__(function.__name__)(*args, **kwargs)
    globals()[function.__name__] = mame
    return function"))


(defun cs-py-wsgi-startresponse ()
  (interactive)
  (insert
"start_response('200 OK', [
                ('Content-Type', 'application/json'),
                ('Access-Control-Allow-Origin', 'http://localhost:8888'),
                ('Cache-Control', 'no-cache, no-store, must-revalidate, max-age=0, proxy-revalidate, no-transform'),
                ('Content-Length', str(len(response)))])"))

