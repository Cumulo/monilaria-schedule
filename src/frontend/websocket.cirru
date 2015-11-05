
var
  Immutable $ require :immutable
  Pipeline $ require :cumulo-pipeline

= exports.in $ new Pipeline
= exports.out $ new Pipeline

= exports.setup $ \ (options)

  exports.in.for $ \ (data)
    socket.send $ JSON.stringify data

  var socket $ new WebSocket $ + :ws:// location.host :: options.port
  = socket.onmessage $ \ (event)
    var data $ JSON.parse event.data
    exports.out.send $ Immutable.fromJS data

  = socket.onopen options.onopen
  = socket.onclose $ \ ()
    setTimeout
      \ () (window.location.reload)
      , 10000
