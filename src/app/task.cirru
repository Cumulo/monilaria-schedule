
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  base $ require :../util/base

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div input span) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-task

  :propTypes $ {}
    :task $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :dispatch React.PropTypes.func.isRequired

  :onTitleChange $ \ (event)
    @props.dispatch :task/update $ {}
      :title event.target.value
      :id $ @props.task.get :id

  :onBeginChange $ \ (event)
    @props.dispatch :task/update $ {}
      :begin event.target.value
      :id $ @props.task.get :id

  :onDurationChange $ \ (event)
    @props.dispatch :task/update $ {}
      :duration event.target.value
      :id $ @props.task.get :id

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      input $ {} (:style $ @styleInput)
        :value $ @props.task.get :title
        :onChange @onTitleChange
      Space $ {} $ :height 10
      div ({} (:style $ @styleControl))
        span ({} (:style $ @styleField)) :Stage:
        Space $ {} $ :width 5
        span ({} (:style $ @styleLabel)) $ @props.task.get :stage
        Space $ {} $ :width 20
        span ({} (:style $ @styleField)) :Requests:
        Space $ {} $ :width 5
        span ({} (:style $ @styleLabel)) $ @props.task.get :requests
      Space $ {} $ :height 10
      div ({} (:style $ @styleControl))
        span ({} (:style $ @styleField)) :Begin:
        Space $ {} $ :width 5
        input $ {} (:style $ @styleInlineInput)
          :value $ @props.task.get :stage
          :onChange @onBeginChange
          :placeholder ":write down the time you began"
        Space $ {} $ :width 20
        span ({} (:style $ @styleField)) :Duration:
        Space $ {} $ :width 5
        input $ {} (:style $ @styleInlineInput)
          :vlaue $ @props.task.get :requests
          :onChange @onDurationChange
          :placeholder ":Estimate a duration"

  :styleRoot $ \ ()
    {}
      :width :400px
      :height :200px
      :border $ + ":1px solid " $ hsl 0 0 90
      :display :inline-block
      :padding ":10px"
      :marginRight 10

  :styleInput $ \ ()
    {}
      :lineHeight :30px
      :fontSize :14px
      :width :100%
      :outline :none
      :padding ":0 5px"

  :styleControl $ \ ()
    {}

  :styleLabel $ \ ()
    {}
      :backgroundColor $ hsl 200 60 60
      :padding ":0 5px"
      :lineHeight :26px
      :display :inline-block
      :verticalAlign :middle
      :color :white
      :fontFamily base.guideFonts

  :styleInlineInput $ \ ()
    {}
      :lineHeight :30px
      :fontSize :14px
      :width :100px
      :outline :none
      :padding ":0 5px"

  :styleField $ \ ()
    {}
      :fontFamily base.guideFonts
      :fontSize :12px
