module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        expand: true
        cwd: 'coffee'
        src: '*.coffee'
        dest: 'js'
        ext: '.js'

    connect:
      server:
        options:
          bare: false
          keepalive: true
          port: 3000

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'default', ['coffee', 'connect']
