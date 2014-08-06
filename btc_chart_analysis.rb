path = File.expand_path '../', __FILE__

require "#{path}/config/env.rb"

class BtcChartAnalysis < Sinatra::Base
  include Voidtools::Sinatra::ViewHelpers

  get "/" do
    haml :index
  end
  
  get "/chart" do
    haml :chart
  end
end

require_all "#{path}/routes"