require 'httparty'

def get_api_response(option, query)

  if option && query
	base = 'https://api.spoonacular.com/food/products/search?apiKey=' + ENV['SP_API_KEY'] + '&number=10'
	endpoint = base + '&query=' + query
	results = HTTParty.get(endpoint)
	parsed = JSON.parse(results.to_s)
	10.times do |i|
	  print parsed["products"][i]["title"]

	  puts ""

	end
  end
end
