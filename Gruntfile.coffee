module.exports = (grunt) ->
  'use strict'
  # Project configuration.
  grunt.initConfig
    coffee:
      app:
        expand: true
        cwd: 'assets/coffee'
        src: '{,**/}*.coffee'
        dest: 'public/js'
        ext: '.js'
    requirejs:
      main:
        options:
          appDir: 'public/js',
          baseUrl: 'lib',
          dir: 'public/build',
          paths: {
            app: '../app',
            root: '../'
          },
          modules: [
            {
              name: '../common',
              include: []
            },
            {
              name: '../app/m3',
              exclude: ['../common']
            }
          ]
    sass:
      app:
        options:
          compass: true
          require: 'susy'
#          style: 'compressed'
        files:
          'public/css/root.css': 'assets/sass/root.sass'
    watch:
      coffee:
        files: 'assets/coffee/**/*.coffee'
        tasks: ['newer:coffee']
      sass:
        files: 'assets/sass/**/*.sass'
        tasks: ['newer:sass']
      livreload:
        options:
          livereload: true
        files:[
          'public/*.html'
          'public/css/*.css'
          'public/js/*.js'
        ]
    connect:
      options:
        port: 9000
        livereload: 35729,
        hostname: "0.0.0.0"
      livereload:
        options:
          open: true
          base: 'public'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-requirejs'
  grunt.loadNpmTasks 'grunt-newer'


  # Default task.
  grunt.registerTask 'default', ['coffee', 'sass', 'watch']
  grunt.registerTask 'server', ['connect:livereload', 'watch']
