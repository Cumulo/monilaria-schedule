
var
  database $ require :./backend/database
  differ $ require :./backend/differ
  expand $ require :./backend/expand
  websocket $ require :./backend/websocket
  Pipeline $ require :cumulo-pipeline

websocket.setup $ {}
  :port 4005

differ.setup $ {}
  :expand expand

websocket.out.for $ \ (data)
  console.log :websocket.out
    JSON.stringify data

websocket.out.forward database.in
database.out.forward differ.in
differ.out.forward websocket.in

differ.out.for $ \ (db)
