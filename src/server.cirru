
var
  ws $ require :ws
  diff $ require :immutablediff
  shortid $ require :shortid
  recorder $ require :actions-recorder

var
  expand $ require :./backend/expand
  schema $ require :./schema
  updater $ require :./updater

var
  wsCaches $ {}

recorder.setup $ {}
  :initial schema.database
  :updater updater

if module.hot $ do
  module.hot.accept ([] :./schema :./updater) $ \ ()
    = schema $ require :./schema
    = updater $ require :./updater
    recorder.hotSetup $ {}
      :initial schema.database
      :updater updater
  module.hot.accept ([] :./backend/expand) $ \ ()
    = expand $ require :./backend/expand
    recorder.dispatch :server/expand null null

var wss $ new ws.Server $ {} (:port 4005)
wss.on :connection $ \ (socket)
  var
    stateId $ shortid.generate
    now $ new Date
  = (. wsCaches stateId) $ {}
    :socket socket
    :cache schema.store
  recorder.dispatch :state/connect null
    {} (:stateId stateId) (:time $ now.valueOf)

  socket.on :message $ \ (rawData)
    var
      action $ JSON.parse rawData
      now $ new Date
      actionType action.type
      actionData action.data
      actionMeta $ {}
        :stateId stateId
        :id $ shortid.generate
        :time $ now.valueOf
    recorder.dispatch actionType actionData actionMeta

  socket.on :close $ \ ()
    var
      now $ new Date
    delete (. wsCaches stateId)
    recorder.dispatch :state/disconnect null
      {} (:stateId stateId) (:time $ now.valueOf)

console.info ":ws server listening at 4005"

recorder.subscribe $ \ (core)
  var
    stateIdList $ Object.keys wsCaches
    db $ core.get :store
  stateIdList.forEach $ \ (stateId)
    var
      reference $ . wsCaches stateId
      store $ expand core stateId
      changes $ diff reference.cache store
    reference.socket.send $ JSON.stringify changes
    = reference.cache store
