
var
  recorder $ require :actions-recorder

var
  differ $ require :./backend/differ
  expand $ require :./backend/expand
  schema $ require :./schema
  updater $ require :./updater
  websocket $ require :./backend/websocket
  Pipeline $ require :cumulo-pipeline

recorder.setup $ {}
  :initial schema.database
  :updater updater

var emitter $ \ (core)
  differ.out.send core

recorder.request emitter
recorder.subscribe emitter

websocket.setup $ {}
  :port 4005

differ.setup $ {}
  :expand expand

websocket.out.for $ \ (data)
  console.log :websocket.out
    JSON.stringify data
  recorder.dispatch data.type data

differ.out.forward websocket.in
