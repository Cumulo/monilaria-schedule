
var
  React $ require :react
  ReactDOM $ require :react-dom
  Pipeline $ require :cumulo-pipeline
  schema $ require :../schema
  actions $ require :../frontend/actions

var
  ({}~ div) React.DOM

= exports.in $ new Pipeline

var pageComponent $ React.createClass $ {}
  :displayName :app-page

  :getInitialState $ \ ()
    {}
      :store schema.store

  :componentWillMount $ \ ()
    exports.in.for $ \\ (data)
      if (is data.target :store) $ do
        @setState $ {} $ :store data.data
      , undefined

  :render $ \ ()
    div null

var
  Page $ React.createFactory pageComponent

ReactDOM.render (Page) (document.querySelector :#app)
