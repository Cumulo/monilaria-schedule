
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-table

  :propTypes $ {}
    :tasks $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :dispatch React.PropTypes.func.isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot))

  :styleRoot $ \ ()
    {}
      :flex 1
