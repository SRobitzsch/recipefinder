class RecipesController < ApplicationController
  def index
    #params is a rails hash
    @search_term = params[:search] || 'choclate'
    @recipes = Recipe.for(@search_term)
  end
end
