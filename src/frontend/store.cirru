
var
  Immutable $ require :immutable
  Pipeline $ require :cumulo-pipeline
  patch $ require :immutablepatch

= exports.in $ new Pipeline

var _store $ Immutable.Map

= exports.out $ exports.in.reduce _store $ \ (store diff)
  patch store diff
