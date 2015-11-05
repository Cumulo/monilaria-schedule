
var
  fs $ require :fs

= module.exports $ object
  :entry $ object
    :vendor $ [] :react :react-dom :immutable
      , :webpack-dev-server/client?http://0.0.0.0:8080
      , :webpack/hot/dev-server
    :main $ [] :./src/main

  :output $ object
    :path :build/
    :filename :[name].js
    :publicPath :http://repo:8080/build/

  :resolve $ object
    :extensions $ array :.js :.cirru :

  :module $ object
    :loaders $ array
      object (:test /\.cirru$) (:loader :cirru-script)