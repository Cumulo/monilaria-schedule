
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  base $ require :../util/base

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div input) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-login

  :propTypes $ {}
    :dispatch React.PropTypes.func.isRequired

  :getInitialState $ \ ()
    {}
      :name :
      :password :

  :onNameChange $ \ (event)
    @setState $ {} (:name event.target.value)

  :onPasswordChange $ \ (event)
    @setState $ {} (:password event.target.value)

  :onLogin $ \ ()
    @props.dispatch :account/login $ {}
      :name @state.name
      :password @state.password

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      div ({} (:style $ @styleHint)) ":Login or create account:"
      Space $ {} $ :height 10
      input $ {} (:style $ @styleInput)
        :value @state.name
        :onChange @onNameChange
        :placeholder ":Account name"
        :type :text
      Space $ {} $ :height 10
      input $ {} (:style $ @styleInput)
        :value @state.password
        :type :password
        :onChange @onPasswordChange
        :placeholder ":Password"
      Space $ {} $ :height 10
      div ({} (:style $ @styleControl))
        div
          {} (:style $ @styleButton) (:onClick @onLogin)
          , :Login

  :styleRoot $ \ ()
    {}
      :display :flex
      :flexDirection :column
      :padding ":10px"

  :styleInput $ \ ()
    {}
      :outline :none
      :lineHeight :30px
      :fontSize :14px
      :padding ":0 10px"
      :width :100%
      :border $ + ":1px solid " $ hsl 0 10 90
      :fontFamily base.contentFonts

  :styleControl $ \ ()
    {}
      :display :flex
      :justifyContent :flex-end

  :styleButton $ \ ()
    {}
      :lineHeight :30px
      :fontSize :14px
      :backgroundColor $ hsl 200 40 60
      :fontFamily base.guideFonts
      :padding ":0 10px"
      :color :white

  :styleHint $ \ ()
    {}
      :fontFamily base.contentFonts
      :fontSize :14px
      :color $ hsl 0 0 40
