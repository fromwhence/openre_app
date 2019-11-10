class Api::OpenHousesController < ApplicationController

  def index
    @open_houses = OpenHouse.all   
    
    search_zip = params[:zip] || ""
    search_category = params[:category] || ""
    search_date = params[:date] || ""

    @open_houses = OpenHouse.joins(:property)

    if search_zip != ""
      @open_houses = @open_houses.where("properties.address iLIKE ?", "%#{search_zip}")
    end

    if search_category != ""
      @open_houses = @open_houses.where("properties.home_category = ?", search_category)
    end

    if search_date != ""
      @open_houses = @open_houses.where("open_houses.start_time >= ? AND open_houses.start_time <= ?", "#{search_date} 00:00:00", "#{search_date} 23:59:59")
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
