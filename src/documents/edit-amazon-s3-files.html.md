---
title: "Edit Amazon S3 Files"
author: "StanGeorge"
created: "March 24, 2014"
edited: "March 27, 2014"
layout: "default"
isPage: true
preview: "You can use Cyberduck to edit Amazon S3 files locally and automatically upload them. This software can be installed on Windows or Mac and you can use your favourite editor."
---
If you need to edit files on linux, please visit [this link](edit-amazon-s3-files-linux.html).

Edit [Amazon S3](http://en.wikipedia.org/wiki/Amazon_S3) files locally on your Windows or Mac using [Cyberduck](http://cyberduck.io). Saving the local changes automatically uploads the file to Amazon S3. The screenshots below show how to setup, login, view and edit the files.
Download and install Cyberduck (version 4.4.3 as of this writing). Download the [S3 (HTTPS).cyberduckprofile](https://svn.cyberduck.io/trunk/profiles/S3%20(HTTPS).cyberduckprofile) file and open it. It should show you a window where you can enter your Amazon "Access Key ID". Once you do that, it will let you login with your Amazon "Secret Access Key".

<img style="max-width:100%;" width="700px" height="701px" src="http://d27jzba8aj5ptt.cloudfront.net/s3-setup-cyberduck-bookmark.PNG" alt="Screenshot of Cyberduck bookmark for Amazon S3" title="Setup the Cyberduck bookmark after downloading the HTTPS profile (link at the bottom)"/>

Once you login, you should be able to view your files as shown below. Now you can edit your files in your favourite editor either by using the Windows shortcut Ctrl+K or right-click and select the program to edit the file. I made [Notepad++](http://notepad-plus-plus.org/) the default editor for my HTML files. Make changes as you normally would and save the files. The file changes are automatically updated on Amazon S3.

<img style="max-width:100%;" width="700px" height="596px" src="http://d27jzba8aj5ptt.cloudfront.net/s3-edit-file.PNG" alt="Screenshot of editing Amazon S3 files" title="Edit the files in your S3 bucket."/>

**External Links**
1. For additional setup details visit [this link](https://trac.cyberduck.io/wiki/help/en/howto/s3).
2. I found Cyberduck via [this blog post](http://blog.alizweb.com/post/22721624156/instant-editing-of-files-on-amazon-s3-ftp) by alizweb.
3. If you want to host a static website/blog on Amazon S3 then check out [this post](http://chadthompson.me/2013/05/06/static-web-hosting-with-amazon-s3/) by Chad Thompson.
