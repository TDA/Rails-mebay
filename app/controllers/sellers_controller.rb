class SellersController < ApplicationController
  def show
    # get the id
    id = params[:id]
    @seller = Seller.find(id)
  end
end
