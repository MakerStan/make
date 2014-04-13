---
title: "Find dead links on your website"
author: "MakerStan"
created: "April 6, 2014"
edited: "April 6, 2014"
layout: "default"
isPage: true
preview: "This post describe how you can check for dead links on your website. I used the Linux command wget for this."
---
**WORK IN PROGRESS**<br />
I created my website using docpad. I have it locally running as described in [this post](static-website-docpad.html.md). I want to check if I have any dead links on this site. The <code>wget</code> command in Linux helps me do this. 
1. The 'spider' option is to enable crawling recursively (--recursive option). 
2. The --base option specifies a base url for the link on my website that are just file names such as <code>&lt;a href="index.html"&gt;Home&lt;/a&gt;</code> instead of fully qualified URLs.

<pre>
wget --spider --recursive --level=1 --force-html --input-file="out/index.html" --base="http://localhost:9778/" -Dlocalhost --delete-after --no-cache
</pre>

**TODO:** Right now this command gives me a lot of output. I do find 404 messages and the broken links, but I need to scroll through the output. One solution is to provice the <code>-o</code> option to have the output routed to a file and then run a <code>grep</code> command to search for 404 errors.

A related task is to find all references to a file in other files. I can do this to get only the files names of other files have a link to 'index.html'
<pre>grep -H "index.html" out/* | cut -d: -f1</pre>
