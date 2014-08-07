# TODO

# get http://api.bitcoincharts.com/v1/csv/

# exclude minor exchanges and localbitcoins

# require 'mechanize'
# agent = Mechanize.new
# page = agent.get "http://api.bitcoincharts.com/v1/csv/"
# file = page.links[1..-1].map{ |l| l.text[0..-6] }

# fiter_out = %w(mtgox localbitcoins)

# exchanges = %w(btcn bitstamp btce itbit anxkh)

exchanges = eval("./config/exchanges.rb")

# currencies = %w(USD EUR CNY HKD)

# AUD JPY NZD GBP
# KRW

file_names = exchanges.map do |fn| 
  fn[:currencies].map do |cur|
    "#{fn[:name]}#{cur}" if cur == "USD" # until there's no history ptice data
  end
end.flatten.compact

puts file_names


