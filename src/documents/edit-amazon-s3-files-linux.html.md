---
title: "Edit Amazon S3 Files on Linux"
author: "StanGeorge"
created: "March 24, 2014"
edited: "March 27, 2014"
layout: "default"
isPage: true
preview: "You can use Amazon Command Line Interface (CLI) to edit Amazon S3 files locally and  upload them using the sync command. This tool can be installed on Linux and you can use your favourite editor."
---
If you need to edit files on Windows or Mac, please visit [this link](edit-amazon-s3-files.html).

Edit [Amazon S3](http://en.wikipedia.org/wiki/Amazon_S3) files locally on Linux using [Amazon CLI](http://aws.amazon.com/cli/). Saving the local changes does NOT automatically upload the file to Amazon S3. Once you are done editing, you need to run the sync command to upload the updated files. The code snippets below show how to setup, login, view and edit the files.

<pre>
sudo apt-get install python-pip *#Install pip*
sudo pip install awscli *#Install the awscli python package*
aws help *#Test to see if the install went well*

*\#Configure Amazon Access Key ID, Secret Access Key, Default region name.*
aws configure *#This info is stored in this file: ~/.aws/config*

*\#This will list all files in the bucket called make.stanleygeorge.com*
aws s3 ls s3://make.stanleygeorge.com

*\#This will copy all the files from the S3 bucket to the current directory*
aws s3 sync s3://make.stanleygeorge.com .

*\#This will copy all the files from the current directory to the S3 bucket.*
*\#The 'grants' option grants read permissions on the files to everyone.*
aws s3 sync . s3://make.stanleygeorge.com --grants read=uri=http://acs.amazonaws.com/groups/global/AllUsers
</pre>
Here is the [raw](https://gist.githubusercontent.com/StanGeorge/9865462/raw/install-amazon-cli.sh) version of the script above.

If you need to manage a lot of pages, a tool like DocPad will help. See [this post](static-website-docpad.html) on how to create a static website or blog with Docpad.

**External Links**
1. For additional setup details visit [this link](http://docs.aws.amazon.com/cli/latest/userguide/using-s3-commands.html).
2. If you want to host a static website/blog on Amazon S3 then check out [this post](http://chadthompson.me/2013/05/06/static-web-hosting-with-amazon-s3/) by Chad Thompson.
