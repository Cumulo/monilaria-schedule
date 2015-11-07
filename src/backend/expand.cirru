
var
  Immutable $ require :immutable

= module.exports $ \ (core stateId)
  var
    db $ core.get :store
    state $ db.getIn :states stateId

  db.set :core core
