class AdsController < ApplicationController
  def show
    # get the id
    id = params[:id]
    @ad = Ad.find(id)
  end

  def index
    @ads = Ad.all
  end

  def rand_method
    # this can be any generic method/function that needs to
    # be used by this controller, either taking in params, or using
    # instance variables
  end
end
