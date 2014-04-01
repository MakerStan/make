---
title: "Setup Travis-CI for continuous integration"
author: "MakerStan"
created: "March 29, 2014"
edited: "March 29, 2014"
layout: "default"
isPage: true
preview: "This post shows how we can use Continuous Integration using Travis-CI and deploy a DocPad based static website/blog to Amazon S3. "
---
[Continuous Integration (CI)](http://en.wikipedia.org/wiki/Continuous_integration) tools such as Travis, Jenkins etc. help compile and deploy source code multiple times a day. Install Travis command line tools using the commands below.
<gist>9865462?file=install-travis-cli.sh</gist>

Setup a file named .travis.yml in your git directory as below. This will hook git to travis-ci
<gist>9865462?file=.travis.yml</gist>

Now when you commit to git, a Travis-CI build will be triggered. [This](https://travis-ci.org/MakerStan/make/builds/21890084) is how a sample build looks like. You will also need to add a [policy](https://gist.githubusercontent.com/MakerStan/9865462/raw/47dd49d302a87c9fe0855bb35c4afdb81614c9cc/amazon-s3-bucket-policy-json) on your Amazon S3 bucket so that all files uploaded to it are public read

If you prefer not to use either GitHub or Travis-CI and prefer to upload the files manually to Amazon S3, see [this post](edit-amazon-s3-files-linux.html) on using Amazon CLI tool.

**External Links**
1. Details on getting started with Travis-CI can be found [here](http://docs.travis-ci.com/user/getting-started/).
2. Details on Travis-CI command line tools can be found [here](http://blog.travis-ci.com/2013-01-14-new-client/).
3. S3 Deployment details can be found [here](http://docs.travis-ci.com/user/deployment/s3/).
