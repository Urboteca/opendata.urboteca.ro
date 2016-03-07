# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
bucharest = {
  center: [44.4677, 26.100],
  zoom: 12
}

createCartoDBLayer = () ->
  map_object = L.Map('cartodb-map', bucharest)

  L.tileLayer('http://tile.stamen.com/toner/{z}/{x}/{y}.png', {
    attribution: 'Stamen'
  }).addTo(map_object)

  cartodb.createLayer(
    map_object, 'https://urboteca.cartodb.com/api/v2/viz/aaf8c108-d800-11e5-b49c-0e8c56e2ffdb/viz.json'
  ).addTo(map_object)


createCartoDbVis = () ->
  cartodb.createVis(
    'cartodb-map',
    'https://urboteca.cartodb.com/api/v2/viz/aaf8c108-d800-11e5-b49c-0e8c56e2ffdb/viz.json',
    bucharest
  )

$(document).on('page:load', createCartoDbVis)
