
var
  stir $ require :stir-template
  ({}~ html head body div link script meta title) stir

= module.exports $ \ (data)
  return $ stir.render
    stir.doctype
    html null
      head null
        title null :Monilaria
        meta $ {} (:charset :utf-8)
        script $ {} (:src data.vendor) (:defer true)
        script $ {} (:src data.main) (:defer true)
      body null
        div ({} (:id :app)) ":waiting for data from server..."
