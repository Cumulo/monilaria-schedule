
var
  hsl $ require :hsl
  React $ require :react
  keycode $ require :keycode
  ReactDOM $ require :react-dom
  Immutable $ require :immutable
  schema $ require :../schema

var
  DevTools $ React.createFactory $ require :actions-recorder/lib/devtools

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
      :showDevTools true

  :onPathChange $ \ (newPath)
    @setState $ {} (:path newPath)

  :componentDidMount $ \ ()
    window.addEventListener :keydown @onWindowKeydown

  :componentWillUount $ \ ()
    window.removeEventListener :keydown @onWindowKeydown

  :onWindowKeydown $ \ (event)
    if
      and
        is (keycode event.keyCode) :a
        and event.shiftKey $ or event.metaKey event.ctrlKey
      do
        @setState $ {} (:showDevTools $ not @state.showDevTools)
    , undefined

  :onDispatch $ \ (type data)
    @props.dispatch type data

  :renderDevTools $ \ ()
    div ({} (:style $ @styleDevTools))
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
