class AdsController < ApplicationController
  attr_accessor :instance_variable
  def show
    # get the id
    id = params[:id]
    @ad = Ad.find(id)
    @instance_variable
  end

  def index
    @ads = Ad.all
  end

  def create
    @ads = Ad.all
  end

  def new
    @ad = Ad.new
  end

  def rand_method
    # this can be any generic method/function that needs to
    # be used by this controller, either taking in params, or using
    # instance variables
    @instance_variable = 'sai'
  end

  def instance_method
    # this has access to the instance_variables defined
    puts @instance_variable
  end
end
