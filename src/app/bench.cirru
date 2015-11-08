
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  Login $ React.createFactory $ require :./login

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-bench

  :propTypes $ {}
    :members $ . (React.PropTypes.instanceOf Immutable.List) :isRequired
    :state $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :profile $ React.PropTypes.instanceOf Immutable.Map
    :dispatch React.PropTypes.func.isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      cond (@props.state.get :isLoggedIn)
        @renderMembers
        Login $ {} (:dispatch @props.dispatch)

  :styleRoot $ \ ()
    {}
      :width :300px
      :background $ hsl 120 20 98
