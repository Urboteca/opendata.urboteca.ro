// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var createCartoDBVis;
createCartoDBVis = function() {

  cartodb.createVis('map', gon.map.cartodb_url, {legends: true})
    .done(function(vis, layers) {
      // layer 0 is the base layer, layer 1 is cartodb layer
      // when setInteraction is disabled featureOver is triggered
      layers[1].setInteraction(true);

      // you can get the native map to work with it
      var cartoMap = vis.getNativeMap();

      // now, perform any operations you need, e.g. assuming map is a L.Map object:
      cartoMap.setZoom(11);
      //cartoMap.panTo([44.4677, 26.5400]);
  });
};

var createCartoDBTable;
createCartoDBTable = function() {

};

$(document).ready(createCartoDBVis);
$(document).on('page:load', createCartoDBVis);

$(document).ready(createCartoDBTable);
$(document).on('page:load', createCartoDBTable);
