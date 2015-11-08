
var
  hsl $ require :hsl
  React $ require :react
  keycode $ require :keycode
  ReactDOM $ require :react-dom
  Immutable $ require :immutable
  schema $ require :../schema

var
  Table $ React.createFactory $ require :./table
  Bench $ React.createFactory $ require :./bench
  DevTools $ React.createFactory $ require :actions-recorder/lib/devtools
  JSONViewer $ React.createFactory $ require :react-lite-json-viewer

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-page

  :propTypes $ {}
    :store $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :dispatch React.PropTypes.func.isRequired

  :getInitialState $ \ ()
    {}
      :path $ Immutable.List
      :storePath $ Immutable.List
      :showDevTools false
      :showStore false

  :onPathChange $ \ (newPath)
    @setState $ {} (:path newPath)

  :onStorePathChange $ \ (newPath)
    @setState $ {} (:storePath newPath)

  :componentDidMount $ \ ()
    window.addEventListener :keydown @onWindowKeydown

  :componentWillUount $ \ ()
    window.removeEventListener :keydown @onWindowKeydown

  :onWindowKeydown $ \ (event)
    if
      and event.shiftKey $ or event.metaKey event.ctrlKey
      do $ switch (keycode event.keyCode)
        :a
          @setState $ {} (:showDevTools $ not @state.showDevTools)
        :s
          @setState $ {} (:showStore $ not @state.showStore)
    , undefined

  :onDispatch $ \ (type data)
    @props.dispatch type data

  :renderDevTools $ \ ()
    div ({} (:style $ @styleDevTools))
      cond @state.showStore
        JSONViewer $ {}
          :path @state.storePath
          :onChange @onStorePathChange
          :data @props.store
          :height 500
        DevTools $ {}
          :core $ @props.store.get :core
          :path @state.path
          :onPathChange @onPathChange
          :height window.innerHeight
          :width window.innerWidth
          :dispatch @onDispatch

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      cond @state.showDevTools
        @renderDevTools
      div ({} (:style $ @styleContainer))
        Table $ {}
          :tasks $ @props.store.get :tasks
          :dispatch @props.dispatch
        Bench $ {}
          :members $ @props.store.get :members
          :dispatch @props.dispatch
          :state $ @props.store.get :state
          :profile $ @props.store.get :profile

  :styleRoot $ \ ()
    {}

  :styleDevTools $ \ ()
    {}
      :position :fixed
      :width :100%
      :height :100%
      :top 0
      :left 0
      :backgroundColor $ hsl 0 20 10 0.8
      :zIndex 9999

  :styleContainer $ \ ()
    {}
      :position :fixed
      :width :100%
      :height :100%
      :top 0
      :left 0
      :display :flex
      :flexDirection :row
      :alignItems :strech
