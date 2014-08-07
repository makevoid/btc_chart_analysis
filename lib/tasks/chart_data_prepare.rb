
exchanges = eval(File.read "./config/exchanges.rb")
exchanges = exchanges.map{ |e| e[:name] }

for file in exchanges
  file = "bitstampUSD"
  `ruby lib/chart_data.rb #{file} > data/#{file}_1day.csv`
  `ruby lib/chart_data.rb #{file} 30 > data/#{file}_30days.csv`
end