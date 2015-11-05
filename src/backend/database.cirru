
var
  Immutable $ require :immutable
  Pipeline $ require :cumulo-pipeline

var
  schema $ require :../schema

var _database $ Immutable.fromJS schema.database

= exports.in $ new Pipeline

= exports.out $ exports.in.reduce _database $ \ (db action)
  case action.type
    else db
