class BtcChartAnalysis < Sinatra::Base
  get "/" do
    haml :index
  end
end