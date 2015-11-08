
var
  schema $ require :../schema

= exports.create $ \ (db data meta)
  var
    stateId $ meta.get :stateId
    metaId $ meta.get :id
  ... db
    setIn ([] :tasks metaId) $ ... schema.task
      set :id metaId
      set :updated $ meta.get :time

= exports.update $ \ (db data meta)
  var
    taskId $ data.get :id
  ... db
    updateIn ([] :tasks taskId) $ \ (task)
      ... task (merge data)
        set :time $ meta.get :time

= exports.request $ \ (db data meta)
  var
    taskId data
  ... db
    updateIn ([] :tasks taskId :requests) $ \ (requests)
      + requests 1
    setIn ([] :tasks taskId :time) $ meta.get :time
