(function() {
  var main;

  main = function() {
    var csv_name, g;
    csv_name = "bitstampUSD_1day";
    csv_name = "bitstampUSD_30days";
    return g = new Dygraph(document.querySelector(".graph"), "/data/" + csv_name + ".csv", {
      rollPeriod: 3,
      showRoller: true,
      drawYGrid: false,
      ylabel: "Volume"
    });
  };

  window.onload = main;

}).call(this);
