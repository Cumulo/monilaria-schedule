
var Immutable $ require :immutable

= exports.task $ Immutable.fromJS $ {}
  :id null
  :title :
  :stage :initial
  :begin null
  :duration null
  :request 0

= exports.account $ Immutable.fromJS $ {}
  :id null
  :account null
  :password :

= exports.profile $ Immutable.fromJS $ {}
  :id null
  :name null
  :avatar null
  :about :
  :isOnline false

= exports.notice $ Immutable.fromJS $ {}
  :id null
  :kind null
  :text :

= exports.state $ Immutable.fromJS $ {}
  :id null
  :accountId null
  :isLoggedIn false
  :isVisible false
  :notices $ {}

= exports.database $ Immutable.fromJS $ {}
  :tasks $ {}
  :states $ {}
  :accounts $ {}
  :profiles $ {}

= exports.store $ Immutable.fromJS $ {}
  :tasks $ []
  :members $ []
  :profile null
  :state null
