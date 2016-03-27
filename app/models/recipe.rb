#My personal developer key
ENV['FOOD2FORK_KEY'] = '903adf6d4f0dc95f9caa65cb10d4a0f4'

class Recipe
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"

  default_options.update(verify: false) # Turn off SSL verification
  default_params key: key_value
  #, field: "image_url,title,social_rank"
  format :json

  #Sample URL http://food2fork.com/api/search?key={API_KEY}&q=shredded%20chicken

  def self.for keyword
    get("/search", query: { q: keyword})["recipes"]
  end
end