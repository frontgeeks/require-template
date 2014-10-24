(function() {
  require(['app/m1/m1'], function() {
    console.log('Module 3 loaded');
    return console.log('Load Module 1 From Module 3');
  });

}).call(this);
