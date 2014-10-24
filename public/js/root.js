(function() {
  console.log('Root module');

  require(['common'], function() {
    console.log('Start load module by common');
    return require(['app/m3']);
  });

}).call(this);
