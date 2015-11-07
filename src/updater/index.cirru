
var
  state $ require :./state

var identity $ \ (x) x

= module.exports $ \ (db type data meta)
  var handler $ case type
    :state/connect state.connect
    :state/disconnect state.disconnect
    else identity
  handler db data meta
