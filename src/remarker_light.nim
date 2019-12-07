import parseopt
import base64
import os
import htmlgen
import jester
import strutils

let doc = """
Remarker Light.

Usage:
  remark_light --file <FILE>
  remark_light --file <FILE> --logo_url <URL> --port 5000
  remark_light (-h | --help)
  remark_light --version

Options:
  -h --help     Show this screen.
  --version     Show version.
  --file FILE   MarkDown File
  --logo_url URL Logo URL
  --port PORT   Listen Port
"""

import strutils
import docopt

let args = docopt(doc, version = "Remarker 1.0")

var
  logo_url = "https://yanjingbookclub.gitee.io/slides/static/yanjing_logo.png"
  listen_port = 5000
var md_file: string
if args["--file"]:
  md_file = $args["--file"]
if args["--logo_url"]:
  logo_url = $args["--logo_url"]
if args["--port"]:
  var args_port = $args["--port"]
  # listen_port = $args["--port"]
  listen_port = args_port.parseInt

settings:
  port = Port(listen_port)
  bindAddr = "127.0.0.1"
  staticDir = getCurrentDir()
  reusePort = false

const remark_js = staticRead("../remark-latest.min.js")

var slides_template = """
<!DOCTYPE html>
<html>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
  <head>
    <style type="text/css">
      /* Slideshow styles */
      .remark-slide-content {
      background-position: right top;
      background-image: url($1);
/*
      background-image: url("http://www.bespinglobal.cn/wp-content/uploads/2017/02/logo.png");
      background-image: url("static/bespin_logo.jpg");
*/

      background-repeat: no-repeat;
      }
    </style>
  </head>
  <body>
     <textarea id="source">
$2
    </textarea>
     <script type="text/javascript" src="static/remark.js">
    </script>
    <script type="text/javascript">
       var slideshow = remark.create();
    </script>
  </body>
</html>

"""

# var slides_template = readFile("./template.html")

echo "Render file: $1" % md_file

routes:
  get "/":
    var markdown_text = readFile(md_file)
# echo slides_template.fmt(markdown_text)
# echo slides_template % [markdown_text]
    var md_resp = slides_template.format(logo_url, markdown_text)
    resp md_resp
  get "/static/remark.js":
    resp remark_js
