class SightingsController < ApplicationController

  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings)
  end

  #1. original render json:
  # def show
  #   sighting = Sighting.find(params[:id])
  #   render json: sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
  # end
  # update render json: statement so that it initializes the SightingSerializer and pass in a variable

 # 2. updated render json: 
  # def show
  #   sighting = Sighting.find(params[:id])
  #   render json: SightingSerializer.new(sighting)
  # end

  #3. rendering relationships: 
  #. set up relationships in sighting_serializer.rb and then to include those objects in the render, create a second options parameter to pass in to the serializer with the objects you want to include. 
  def show
    sighting = Sighting.find_by(id: params[:id])
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
  end

end
