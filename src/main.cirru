
var
  patch $ require :immutablepatch
  React $ require :react
  ReactDOM $ require :react-dom
  Immutable $ require :immutable

var
  schema $ require :./schema

var
  Page $ React.createFactory $ require :./app/page

if module.hot $ do
  module.hot.accept :./schema $ \ ()

var
  store schema.store
  isSocketAlive false

var socket $ new WebSocket $ + :ws://repo:4005

= socket.onopen $ \ ()
  = isSocketAlive true

= socket.onmessage $ \ (event)
  var
    data $ JSON.parse event.data
    dispatch $ \ (type data)
      if isSocketAlive $ do
        socket.send $ JSON.stringify $ {}
          :type type
          :data data
      , undefined
  = store $ patch store (Immutable.fromJS data)

  console.log :store: (store.toJS)
  ReactDOM.render
    Page $ {} (:store store) (:dispatch dispatch)
    document.querySelector :#app

= socket.onclose $ \ ()
  = isSocketAlive false
  setTimeout
    \ () (window.location.reload)
    , 10000
