class Api::PlacesController < ApplicationController
  def index
    @places = Place.all
    render "index.json.jb"
  end

  def show
    @place = Place.find(params[:id])
    render "show.json.jb"
  end

  def create
    @place = Place.new(
      id: params[:id],
      name: params[:name],
      address: params[:address]
      )

    if @place.save
      render "show.json.jb"
    else
      render json: {errors: @place.errors.full_messages}, status: 422
    end
  end

  def update
    @place = Place.find(params[:id])

    @place.id = params[:id] || @place.id
    @place.name = params[:name] || @place.name
    @place.address = params[:address] || @place.address


    if @place.save
      render "show.json.jb" 
    else 
      render json: {errors: @place.errors.full_messages}, status: 422
    end
  end

  def destroy
    place = Place.find(params[:id])
    place.destroy

    render json: {message: "deleted!"}
  end
end
