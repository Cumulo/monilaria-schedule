
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  Login $ React.createFactory $ require :./login
  Profile $ React.createFactory $ require :./profile

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-bench

  :propTypes $ {}
    :members $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :state $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :profile $ React.PropTypes.instanceOf Immutable.Map
    :dispatch React.PropTypes.func.isRequired

  :renderMembers $ \ ()
    ... @props.members
      map $ \ (value key)
        Profile $ {} (:profile value) (:key key)
      valueSeq

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      cond (@props.state.get :isLoggedIn)
        div ({})
          Profile $ {} (:profile @props.profile)
          @renderMembers
        Login $ {} (:dispatch @props.dispatch)

  :styleRoot $ \ ()
    {}
      :width :300px
      :background $ hsl 120 20 98
