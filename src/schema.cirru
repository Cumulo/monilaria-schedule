
var Immutable $ require :immutable

= exports.task $ Immutable.fromJS $ {}
  :id null
  :title :
  :stage :initial

= exports.user $ Immutable.fromJS $ {}
  :id null
  :name null
  :avatar null

= exports.database $ Immutable.fromJS $ {}
  :tasks $ []
  :users $ []
  :states $ {}

= exports.store $ Immutable.fromJS $ {}
  :tasks $ []
  :users $ []
