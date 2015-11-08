
var
  Immutable $ require :immutable

var
  schema $ require :../schema

= module.exports $ \ (core stateId)
  var
    db $ core.get :store
    state $ db.getIn $ [] :states stateId
    isLoggedIn $ cond (? state)
      state.get :isLoggedIn
      , false

  ... schema.store
    set :tasks $ db.get :tasks
    set :state state
    set :members $ cond isLoggedIn
      db.get :members
      Immutable.List
    set :profile $ cond isLoggedIn
      db.getIn $ [] :profiles (state.getIn :accountId)
    set :core core
