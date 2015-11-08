
var
  hsl $ require :hsl
  React $ require :react
  Immutable $ require :immutable

var
  base $ require :../util/base

var
  Space $ React.createFactory $ require :react-lite-space

var
  ({}~ div) React.DOM

= module.exports $ React.createClass $ {}
  :displayName :app-profile

  :propTypes $ {}
    :profile $ . (React.PropTypes.instanceOf Immutable.Map) :isRequired

  :render $ \ ()
    div ({} (:style $ @styleRoot))
      div ({} (:style $ @styleAvatar))
      Space $ {} $ :width 5
      div ({} (:style $ @styleDetail))
        div ({} (:style $ @styleName))
          @props.profile.get :name
        div ({} (:style $ @styleAbout))
          @props.profile.get :about

  :styleRoot $ \ ()
    {}
      :display :flex
      :padding ":5px 0"

  :styleAvatar $ \ ()
    {}
      :backgroundImage $ + ":url("
        or (@props.profile.get :avatar) base.detaultAvatar
        , ":)"
      :backgroundSize :cover
      :width :40px
      :height :40px

  :styleDetail $ \ ()
    {}

  :styleName $ \ ()
    {}
      :fontFamily base.contentFonts

  :styleAbout $ \ ()
    {}
      :fontFamily base.contentFonts
      :color $ hsl 0 0 50
      :fontSize :13px
