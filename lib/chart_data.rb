PATH = File.expand_path "../../", __FILE__

class ChartData

  def initialize(csv_name, delta)
    @delta = 1 # days
    @file = File.read "#{PATH}/data/#{csv_name}.csv"
    @lines = @file.split "\n"
    headers = [:time, :price, :volume]
    @data = @lines.map do |line|
      time, price, volume = line.split ","
      time = Time.at time.to_i
      # time = time.strftime("%Y-%m-%dT%H:%M")
      # { time: time, price: price.to_f, volume: volume.to_f }
      { time: time, volume: volume.to_f }
    end

    # free memory
    @file  = nil
    @lines = nil
  end

  # 1315922016,5.800000000000,1.000000000000

  attr_reader :data


  def aggregate(delta_days=1) # 1 day, or 30 days
    # TODO: use @delta
    data_aggr = []
    day_last = nil
    @data.each do |dat|
      day_this = day dat[:time]

      unless day_this == day_last
        data_aggr << dat
      else
        data_aggr.last[:volume] += dat[:volume]
      end

      day_last = day_this
    end

    data_aggr
  end

  def volume!
    @data = aggregate 1
  end

  def total! # total volume / volume
    @data = aggregate 30
  end


  # csv


  def to_csv
    out = []
    for dat in @data
      out << "#{dat[:time]},#{dat[:price]},#{dat[:volume]}"
    end
    out.join("\n")
  end

  def to_csv_volume
    out = []
    for dat in @data
      out << "#{dat[:time]},#{dat[:volume]}"
    end
    out.join("\n")
  end

  ###


  protected

  def day(time)
    Time.new time.year, time.month, time.day
  end

end


# usage: ruby lib/chart_data.rb > data/bitstampUSD_1day.csv
# usage: ruby lib/chart_data.rb 30 > data/bitstampUSD_30days.csv

days = ARGV[0] ? ARGV[0].to_i : 1 # defaults to 1 day

csv_name = "bitstampUSD"
chart = ChartData.new csv_name, days
# puts chart.data
# puts chart.volume
chart.volume!
puts chart.to_csv_volume
# puts chart.to_csv