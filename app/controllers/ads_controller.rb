class AdsController < ApplicationController
  def show
    # get the id
    id = params[:id]
    @ad = Ad.find(id)
  end

  def index
    @ads = Ad.all
  end
end
