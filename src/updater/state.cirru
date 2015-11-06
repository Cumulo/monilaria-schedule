
var
  schema $ require :../schema

= exports.connect $ \ (db action)
  var
    stateId action.state
    userId $ db.getIn $ [] :states stateId :userId
  ... db
    updateIn ([] :states action.stateId) $ \ (prev)
      schema.state.set :id action.stateId

= exports.disconnect $ \ (db action)
  var
    stateId action.stateId
    userId $ db.getIn $ [] :states stateId :userId
  ... db
    deleteIn $ [] :states stateId
    updateIn ([] :users) $ \ (users)
      users.map $ \ (aUser)
        cond (is (aUser.get :id) userId)
          aUser.set :isOnline false
          , aUser
    deleteIn ([] :buffers stateId)
