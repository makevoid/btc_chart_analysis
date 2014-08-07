main = ->
  # csv_name = "bitstampUSD_test2"
  csv_name = "bitstampUSD_1day"
  csv_name = "bitstampUSD_30days"

  # dygraph.js
  g = new Dygraph(
    document.querySelector(".graph"),
    "/data/#{csv_name}.csv",
    {
      #rollPeriod: 1, # real
      rollPeriod: 3,  # smoothed a bit
      #rollPeriod: 7,
      showRoller: true,
      drawYGrid: false,
      # interactionModel: {
      #   mousedown: dyg_mousedown
      # }
      # legend: 'always',
      ylabel: "Volume"
    }
  )

# dyg_mousedown = (event, g, context) ->


window.onload = main
