
var
  task $ require :./task
  state $ require :./state
  account $ require :./account

var identity $ \ (x) x

= module.exports $ \ (db type data meta)
  var handler $ case type

    :task/create task.create
    :task/update task.update

    :state/connect state.connect
    :state/disconnect state.disconnect

    :account/login account.login

    else identity
  handler db data meta
