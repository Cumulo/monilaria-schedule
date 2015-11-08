
var
  Immutable $ require :immutable

var
  schema $ require :../schema
  base $ require :../util/base

= exports.login $ \ (db data meta)
  var
    stateId $ meta.get :stateId
    name $ data.get :name
    password $ data.get :password
    metaId $ meta.get :id
    account $ ... db (get :accounts) $ find $ \ (value key)
      is (value.get :account) name
    hasUser $ ? account
    isMatch $ cond hasUser
      is password (account.get :password)
      , false

  cond hasUser
    cond isMatch
      ... db
        setIn ([] :states stateId :accountId) (account.get :id)
        setIn ([] :states stateId :isLoggedIn) true
      , db
    ... db
      setIn ([] :accounts metaId) $ ... schema.account
        set :id metaId
        set :account name
        set :password password
      setIn ([] :profiles metaId) $ ... schema.profile
        set :name name
        set :avatar base.defaultAvatar
        set :about ":About me"
      setIn ([] :states stateId :accountId) metaId
      setIn ([] :states stateId :isLoggedIn) true
