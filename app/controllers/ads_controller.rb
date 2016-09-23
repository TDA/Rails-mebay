class AdsController < ApplicationController
  attr_accessor :instance_variable
  before_filter :check_logged_in, :only => [:edit, :update, :delete]
  def show
    # get the id
    id = params[:id]
    @ad = Ad.find(id)
  end

  def index
    @ads = Ad.all
  end

  def create
    @ad = Ad.new(sanitize_params)
    @ad.save
    redirect_to action: "show", id: @ad
  end

  def new
    @ad = Ad.new
  end

  def edit
    show
  end

  def update
    show
    puts sanitize_params
    @ad.update_attributes(sanitize_params)
    redirect_to action: "show", id: @ad
  end

  def delete
    show
    # destroy vs delete => use destroy :)
    @ad.destroy
    redirect_to action: "index"
  end

  def sanitize_params
    params.require(:ad).permit!
  end

  private
  def check_logged_in
    authenticate_or_request_with_http_basic("Ads") do |username, password|
      username == 'admin' && password == 'pass'
    end
  end
  # def rand_method
  #   # this can be any generic method/function that needs to
  #   # be used by this controller, either taking in params, or using
  #   # instance variables
  #   @instance_variable = 'sai'
  # end

  # def instance_method
  #   # this has access to the instance_variables defined
  #   puts @instance_variable
  # end
end
