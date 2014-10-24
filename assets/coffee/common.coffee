requirejs.config
  baseUrl: 'js/lib'
  paths: {
    app: '../app'
    root: '../'
  }

require ['app/m1/m1', 'app/m2/m2'], () ->
  console.log('all module loaded')
