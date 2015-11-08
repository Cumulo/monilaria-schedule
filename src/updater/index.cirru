
var
  state $ require :./state
  account $ require :./account

var identity $ \ (x) x

= module.exports $ \ (db type data meta)
  var handler $ case type

    :state/connect state.connect
    :state/disconnect state.disconnect

    :account/login account.login

    else identity
  handler db data meta
