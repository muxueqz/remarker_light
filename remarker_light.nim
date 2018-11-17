import os
import htmlgen
import jester
# import strformat
import strutils

var remark_js = readFile("./remark-latest.min.js")
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

var md_file = paramStr(1)
# echo paramCount(), " ", paramStr(1)



routes:
  get "/":
    # resp h1("Hello world")
# var markdown_text = readFile("./nim.md")
    var markdown_text = readFile(md_file)
# echo slides_template.fmt(markdown_text)
# echo slides_template % [markdown_text]
    var logo_url = "http://www.bespinglobal.cn/wp-content/uploads/2017/02/logo.png"
    var md_resp = slides_template.format(logo_url, markdown_text)
    resp md_resp
  get "/static/remark.js":
    resp remark_js
