
var
  stir $ require :stir-template
  ({}~ html head body div link script meta title) stir

var
  style $ stir.createFactory :style

= module.exports $ \ (data)
  return $ stir.render
    stir.doctype
    html null
      head null
        title null :Monilaria
        meta $ {} (:charset :utf-8)
        script $ {} (:src data.vendor) (:defer true)
        script $ {} (:src data.main) (:defer true)
        style null ":body * {box-sizing: border-box;}"
      body null
        div ({} (:id :app)) ":waiting for data from server..."
