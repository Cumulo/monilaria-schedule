
var
  store $ require :./frontend/store
  websocket $ require :./frontend/websocket
  actions $ require :./frontend/actions
  page $ require :./app/page
  Pipeline $ require :cumulo-pipeline

websocket.setup $ {}
  :port 4005
  :onopen $ \ ()
    var accountInfo $ JSON.parse $ or
      localStorage.getItem :immutable-chat-account
      , :{}
    if (? accountInfo.name) $ do
      actions.action $ {}
        :type :account/login
        :data accountInfo
    , undefined

websocket.out.forward store.in
actions.out.forward websocket.in

store.out.for $ \ (data)
  page.in.send $ {}
    :target :store
    :data data
