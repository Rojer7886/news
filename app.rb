require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "abd0e095325eec11daa9ef0708b16f1e"

get "/" do
    view "ask"
  # show a view that asks for the location
end

get "/news" do
  # do everything else
end