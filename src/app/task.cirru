
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  base $ require :../util/base

var
  Space $ React.createFactory $ require :react-lite-space
  TimedInput $ React.createFactory $ require :./timed-input

var
  ({}~ div input span) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-task

  :propTypes $ {}
    :task $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired
    :dispatch React.PropTypes.func.isRequired

  :onTitleChange $ \ (text)
    @props.dispatch :task/update $ {}
      :title text
      :id $ @props.task.get :id

  :onBeginChange $ \ (text)
    @props.dispatch :task/update $ {}
      :begin text
      :id $ @props.task.get :id

  :onDurationChange $ \ (text)
    @props.dispatch :task/update $ {}
      :duration text
      :id $ @props.task.get :id

  :onRequest $ \ ()
    @props.dispatch :task/request (@props.task.get :id)

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      TimedInput $ {} (:style $ @styleInput)
        :value $ @props.task.get :title
        :onChange @onTitleChange
        :time $ @props.task.get :time
      Space $ {} $ :height 10
      div ({} (:style $ @styleControl))
        span ({} (:style $ @styleField)) :Stage:
        Space $ {} $ :width 5
        span ({} (:style $ @styleLabel)) $ @props.task.get :stage
        Space $ {} $ :width 20
        span ({} (:onClick @onRequest))
          span ({} (:style $ @styleField)) :Requests:
          Space $ {} $ :width 5
          span ({} (:style $ @styleLabel)) $ @props.task.get :requests
      Space $ {} $ :height 10
      div ({} (:style $ @styleControl))
        span ({} (:style $ @styleField)) :Begin:
        Space $ {} $ :width 5
        TimedInput $ {} (:style $ @styleInlineInput)
          :value $ @props.task.get :begin
          :onChange @onBeginChange
          :placeholder ":write down the time you began"
          :time $ @props.task.get :time
        Space $ {} $ :width 20
        span ({} (:style $ @styleField)) :Duration:
        Space $ {} $ :width 5
        TimedInput $ {} (:style $ @styleInlineInput)
          :value $ @props.task.get :duration
          :onChange @onDurationChange
          :placeholder ":Estimate a duration"
          :time $ @props.task.get :time

  :styleRoot $ \ ()
    {}
      :width :400px
      :height :200px
      :border $ + ":1px solid " $ hsl 0 0 90
      :display :inline-block
      :padding ":10px"
      :marginRight 10
      :marginBottom 10

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
