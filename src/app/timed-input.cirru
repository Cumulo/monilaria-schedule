
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  ({}~ input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-avatar

  :propTypes $ {}
    :value React.PropTypes.string.isRequired
    :time React.PropTypes.number.isRequired
    :onChange React.PropTypes.func.isRequired
    :isEditable React.PropTypes.bool
    :style React.PropTypes.object.isRequired
    :placeholder React.PropTypes.string

  :getDefaultProps $ \ ()
    {}
      :isEditable true

  :getInitialState $ \ ()
    {}
      :value @props.value
      :time @props.time

  :onChange $ \ (event)
    if @props.isEditable $ do
      @setState $ {}
        :value event.target.value
        :time $ ... (new Date) (valueOf)
      @props.onChange event.target.value
    , undefined

  :render $ \ ()
    input $ {} (:style @props.style)
      :value $ cond (> @state.time @props.time)
        , @state.value @props.value
      :onChange @onChange
      :placeholder @props.placeholder
