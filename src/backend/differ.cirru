
var
  Pipeline $ require :cumulo-pipeline
  Immutable $ require :immutable
  diff $ require :immutablediff
  expand

= exports.in $ new Pipeline
= exports.out $ new Pipeline
= exports.setup $ \ (options)
  = expand options.expand

var _cache $ Immutable.fromJS $ {}

exports.in.for $ \ (db)
  ... db (get :states) $ forEach $ \ (state)
    var
      theCache $ or
        _cache.get (state.get :id)
        Immutable.Map
    if
      or
        isnt (theCache.get :db) db
        isnt (theCache.get :state) state
      do
        var newTree $ expand db state
        var oldTree $ or
          theCache.get :tree
          Immutable.Map
        exports.out.send $ object
          :id $ state.get :id
          :diff $ diff oldTree newTree
        = _cache $ _cache.set (state.get :id) $ ... theCache
          set :db db
          set :state state
          set :tree newTree
    return true
