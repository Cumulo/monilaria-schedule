
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  base $ require :../util/base

var
  Task $ React.createFactory $ require :./task

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-table

  :propTypes $ {}
    :tasks $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :dispatch React.PropTypes.func.isRequired

  :onCreate $ \ ()
    @props.dispatch :task/create

  :renderTasks $ \ ()
    div ({} (:style $ @styleTasks))
      ... @props.tasks
        map $ \\ (value key)
          Task $ {} (:task value) (:key key) (:dispatch @props.dispatch)
        valueSeq

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      @renderTasks
      div
        {} (:style $ @styleCreator) (:onClick @onCreate)
        , :create

  :styleRoot $ \ ()
    {}
      :flex 1
      :padding 10

  :styleCreator $ \ ()
    {}
      :width :200px
      :height :100px
      :backgroundColor $ hsl 0 0 90
      :fontFamily base.guideFonts
      :padding :10px

  :styleTasks $ \ ()
    {}
