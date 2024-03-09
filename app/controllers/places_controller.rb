class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
         if @current_user
      @entries = Entry.where({"place_id" => @place["id"],"user_id" => @current_user["id"]})
    else
      flash["notice"] = "Login first."
      redirect_to "/login"
    end
  end

  def new
  end

  def create
    if @current_user
      @place = Place.new
      @place["name"] = params["name"]
      @place.save
    else
      flash["notice"] = "Login first."
    end
      redirect_to "/places"
  end

end
