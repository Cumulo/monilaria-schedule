
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

  console.log
    db.getIn $ [] :profiles
    state.get :accountId

  ... schema.store
    set :tasks $ db.get :tasks
    set :state state
    set :members $ cond isLoggedIn
      ... db (get :profiles)
      Immutable.List
    set :profile $ cond isLoggedIn
      db.getIn $ [] :profiles (state.get :accountId)
      , null
    set :core core
