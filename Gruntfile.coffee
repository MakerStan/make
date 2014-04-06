module.exports = (grunt) ->
  grunt.initConfig 
    #http://blog.hypercubed.com/archives/2013/10/05/docpad-and-grunt/
    shell:
      docpad:
        options:
          stdout: true
        command: "docpad generate --env static"

    htmlmin: # Task
      dist: # Target
        expand: true
        cwd: '/home/stan/make'
        src: ['out/*.html']
        dest: ''
        options: # Target options
          removeComments: true
          collapseWhitespace: true
          minifyJS:true

  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-contrib-htmlmin');
  grunt.loadNpmTasks('grunt-contrib-uglify');

  grunt.registerTask('generate', ['shell:docpad']);
  grunt.registerTask "default", ['generate', 'htmlmin']
