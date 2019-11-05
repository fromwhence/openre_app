class Api::OpenHousesController < ApplicationController

  def index
    @open_houses = OpenHouse.all   
    
    search_term = params[:search]
      if search_term
        @open_houses = OpenHouse.joins(:property).where("properties.address iLIKE ?", "%#{search_term}%")
      end 

    render 'index.json.jb'   
  end

  def create
    @open_house = OpenHouse.new(
                                property_id: params[:property_id],
                                start_time: params[:start_time],
                                end_time: params[:end_time]
                                )
    if @open_house.save
      render json: {message: 'Open house created successfully'}, status: :created
    else
      render json: {errors: @open_house.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @open_house = OpenHouse.find(params[:id])
    render 'show.json.jb'

  end

  def update
    @open_house = OpenHouse.find(params[:id])
    @open_house.property_id = params[:property_id] || @open_house.property_id
    @open_house.start_time = params[:start_time] || @open_house.start_time
    @open_house.end_time = params[:end_time] || @open_house.end_time

    if @open_house.save
      render 'show.json.jb'
    else
      render json: {errors: @open_house.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @open_house = OpenHouse.find(params[:id])
    @open_house.destroy
    render json: {message: "Successfully Destroyed Open House."}  
  end

end
