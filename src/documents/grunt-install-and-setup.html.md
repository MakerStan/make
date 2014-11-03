---
title: "Grunt: Install and Setup"
author: "StanGeorge"
created: "April 5, 2014"
edited: "April 5, 2014"
layout: "default"
isPage: true
preview: "Grun can automate reperitive tasks for you. It is a JavaScript Task Runner. This post discusses how to install Grunt a automate a few tasks."
---
Lets start by installing Grunt and a few plugins:
<pre>
npm install grunt safeps --save
npm install grunt-cli -g 
npm install grunt-contrib-uglify --save-dev
npm install grunt-contrib-htmlmin --save-dev
npm install --save-dev grunt-shell
</pre>

After the install we need configure the automation in a  Gruntfile. I wrote a CoffeeScript version of the configuration. It does executes the command <code>docpad generate --env static</code>. The other thing it does is minify the HTML that is generated. Here is my <code>Gruntfile.coffee</code>:
<pre>
module.exports = (grunt) -&gt;
  grunt.initConfig
    #http://blog.hypercubed.com/archives/2013/10/05/docpad-and-grunt/
    shell:
      docpad:
        options:
          stdout: true
        command: "docpad generate --env static" #command to process files

    htmlmin: # Task to minimize the HTML files
      dist: # Target
        expand: true
        cwd: '/home/stan/make' #This is the current working directory
        src: ['out/*.html'] #Process html files from the source folder called 'out'
        dest: '' #*Put the processed files back in the same source folder*
        options: # Target options
          removeComments: true
          collapseWhitespace: true
          minifyJS:true

  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-contrib-htmlmin');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.registerTask('generate', ['shell:docpad']);
  grunt.registerTask "default", ['generate', 'htmlmin']
</pre>

