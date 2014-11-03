---
title: "Setup Travis-CI for continuous integration"
author: "StanGeorge"
created: "March 29, 2014"
edited: "April 1, 2014"
layout: "default"
isPage: true
preview: "This post shows how we can use Continuous Integration using Travis-CI and deploy a DocPad based static website/blog to Amazon S3. "
---
[Continuous Integration (CI)](http://en.wikipedia.org/wiki/Continuous_integration) tools such as Travis, Jenkins etc. help compile and deploy source code multiple times a day. Install Travis command line tools using the commands below.
<pre>
sudo apt-get install ruby
sudo apt-get install rubygems
gem uninstall travis-cli #uninstall the old client
sudo gem install travis # install travis
sudo gem install json
sudo gem install travis-lint #to check if .travis.yml file is valid
</pre>
Here is the [raw](https://gist.githubusercontent.com/StanGeorge/9865462/raw/install-travis-cli.sh) version of the script above.

Setup a file named .travis.yml in your git directory as below. This will hook git to travis-ci
<pre>
/#http://docs.travis-ci.com/user/deployment/s3/
deploy:
  provider: s3
  access_key_id: "" #YOUR **ENCRYPTED** AWS ACCESS KEY
  secret_access_key: "" #YOUR **ENCRYPTED** AWS SECRET KEY
  bucket: "make.stanleygeorge.com"
  skip_cleanup: true
  local-dir: out
on:
  tags: true
</pre>
Here is the [raw](https://gist.githubusercontent.com/StanGeorge/9865462/raw/.travis.yml) version of the script above.

**Security**
You can encrypt your AWS credentials using:
<code>
travis encrypt access_key_id:YOUR-AWS-ACCESS-KEY-ID<br />
travis encrypt secret_access_key:YOUR-AWS-SECRET-ACCESS-KEY<br />
</code>
These commands replace the entries in your .travis.yml file with something like this:
<pre>
deploy:
  access_key_id:
      secure: "ABC5OwLpwB7L6Ca...."
  secret_access_key:
      secure: "ABC5OwLpwB7L6Ca...."
</pre>
This set of encryption keys will work ONLY on your repository. If someone forks your repository, then these keys will not work for them. The encrypted keys on the new repository will be different. This is good since you do not have to worry about someone forking your repository and overwriting the files in your S3 bucket.More detais on travis encryption keys can be found [here](http://docs.travis-ci.com/user/encryption-keys/). These files are fairly safe to be committed. A better practice is to use [AWS IAM](http://aws.amazon.com/iam/).

Now when you commit to git, a Travis-CI build will be triggered. [This](https://travis-ci.org/StanGeorge/make/builds/21890084) is how a sample build looks like. You will also need to add a [policy](https://gist.githubusercontent.com/StanGeorge/9865462/raw/47dd49d302a87c9fe0855bb35c4afdb81614c9cc/amazon-s3-bucket-policy-json) on your Amazon S3 bucket so that all files uploaded to it are public read

If you prefer not to use either GitHub or Travis-CI and prefer to upload the files manually to Amazon S3, see [this post](edit-amazon-s3-files-linux.html) on using Amazon CLI tool.

**References**
1. Details on getting started with Travis-CI can be found [here](http://docs.travis-ci.com/user/getting-started/).
2. Details on Travis-CI command line tools can be found [here](http://blog.travis-ci.com/2013-01-14-new-client/).
3. S3 Deployment details can be found [here](http://docs.travis-ci.com/user/deployment/s3/).
