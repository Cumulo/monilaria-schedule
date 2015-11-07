
var
  webpack $ require :webpack
  config $ require :./webpack.config
  fs $ require :fs

= module.exports $ object
  :entry $ object
    :vendor $ [] :react :react-dom :immutable
    :main $ [] :./src/main

  :output $ object
    :path :build/
    :filename :[name].[chunkhash].js
    :publicPath :./build/

  :resolve config.resolve
  :module config.module
  :plugins $ array
    new webpack.optimize.CommonsChunkPlugin :vendor :vendor.js
    new webpack.optimize.UglifyJsPlugin $ object (:sourceMap false)
    \ ()
      this.plugin :done $ \ (stats)
        var
          json $ stats.toJson
          content $ JSON.stringify json.assetsByChunkName null 2
        return $ fs.writeFileSync :build/assets.json content
