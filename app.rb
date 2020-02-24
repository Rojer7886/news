require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "abd0e095325eec11daa9ef0708b16f1e"
url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=7e4fbb2fc3d746ed92638fcad04fc067"


get "/" do
    @news = HTTParty.get(url).parsed_response.to_hash
    view "ask"
  # show a view that asks for the location
end

get "/news" do
    # do everything else
    @location = params["q"]
    results = Geocoder.search("q")
    @lat_long = results.first.coordinates #=> [42.0574063,-87.6722787]

    @forecast = ForecastIO.forecast(@lat_long[0],@lat_long[0]).to_hash
    @current_temperature = @forecast["currently"]["temperature"]
    @conditions = @forecast["currently"]["summary"]

    view "news"
  
end