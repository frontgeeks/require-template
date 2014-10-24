console.log 'Root module'
require ['common'], () ->
  console.log('Start load module by common')
  require ['app/m3']
