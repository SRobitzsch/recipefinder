=begin
The Recipe for class method should
take a keyword to query
query the Food2Fork API for a result.
add the HTTP query parameter key (your developer key) to each out- going URL request to http://food2fork.com/api using HTTParty default params.
obtain the key value from an environment variable FOOD2FORK KEY
obtain the url (and/or port) value from an environment variable FOOD2FORK SERVER AND PORT
=end

class Recipe
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"

  default_params key: key_value , field: "image_url,title,social_rank"
  format :json

  #Sample URL http://food2fork.com/api/search?key={API_KEY}&q=shredded%20chicken

  def self.for term
    get("/search", query: {q: term})["recipes"]
  end
end