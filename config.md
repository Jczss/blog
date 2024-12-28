<!--
Add here global page variables to use throughout your website.
-->
+++
author = "JIANG, Chengzhe"
mintoclevel = 2
div_content = "franklin-content"

# uncomment and adjust the following line if the expected base URL of your website is something like [www.thebase.com/yourproject/]
# please do read the docs on deployment to avoid common issues: https://franklinjl.org/workflow/deploy/#deploying_your_website
# prepath = "yourproject"

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = false
website_title = "狸猫太子"
website_descr = "狸猫太子的RSS订阅"
website_url   = "jiangcz.asia"
+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}
\newcommand{\img}[2]{~~~<img src=~~~!#1~~~ width=~~~!#2~~~>~~~}
\newcommand{\imgc}[2]{~~~<div class=center><img src=~~~!#1~~~ width=~~~!#2~~~></div>~~~}
\newcommand{\imgl}[2]{~~~<div class=left><img src=~~~!#1~~~ width=~~~!#2~~~></div>~~~}
\newcommand{\imgr}[2]{~~~<div class=right><img src=~~~!#1~~~ width=~~~!#2~~~></div>~~~}
\newcommand{\hr}{~~~<div class="center"><ul><li><ul><li><ul><li></li></ul></li></ul></li></ul></div>~~~}
\newcommand{\br}{~~~<br>~~~}
