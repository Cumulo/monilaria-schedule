
var
  schema $ require :../schema

= exports.connect $ \ (db data meta)
  var
    stateId $ meta.get :stateId
    userId $ db.getIn $ [] :states stateId :userId
  ... db
    updateIn ([] :states stateId) $ \ (prev)
      schema.state.set :id stateId

= exports.disconnect $ \ (db data meta)
  var
    stateId $ meta.get :stateId
    userId $ db.getIn $ [] :states stateId :userId
  ... db
    deleteIn $ [] :states stateId
    updateIn ([] :users) $ \ (users)
      users.map $ \ (aUser)
        cond (is (aUser.get :id) userId)
          aUser.set :isOnline false
          , aUser
    deleteIn ([] :buffers stateId)
