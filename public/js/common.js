(function() {
  requirejs.config({
    baseUrl: 'js/lib',
    paths: {
      app: '../app',
      root: '../'
    }
  });

  require(['app/m1/m1', 'app/m2/m2'], function() {
    return console.log('all module loaded');
  });

}).call(this);
