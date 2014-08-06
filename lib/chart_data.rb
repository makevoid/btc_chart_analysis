PATH = File.expand_path "../../", __FILE__

class ChartData
  
  def initialize(csv_name)
    @file = File.read "#{PATH}/data/#{csv_name}.csv"
    @lines = @file.split "\n"
    headers = [:time, :price, :volume]
    @data = @lines.map do |line|
      time, price, volume = line.split ","
      time = Time.at time.to_i
      time = time.strftime("%Y-%m-%dT%H:%M")
      { time: time, price: price.to_f, volume: volume.to_f }
    end
  end
  
  # 1315922016,5.800000000000,1.000000000000
  
  attr_reader :data
  
  def to_csv
    out = []
    for dat in @data
      out << "#{dat[:time]},#{dat[:price]},#{dat[:volume]}"
    end
    out.join("\n")
  end
  
end

chart = ChartData.new "bitstampUSD_test"
# chart.data
puts chart.to_csv