class Api::PropertiesController < ApplicationController
  before_action :authenticate_user, only: [:create, :destroy]

  # def index
  #   @properties = current_user.properties
  #   render 'index.json.jb'
  # end

  def index
    @properties = Property.all
    render 'index.json.jb'
  end

  def create
    @property = Property.new(
                            realtor_id: params[:realtor_id],
                            mls_number: params[:mls_number],
                            home_category: params[:home_category],
                            price: params[:price],
                            address: params[:address],
                            bedrooms: params[:bedrooms],
                            baths: params[:baths],
                            square_footage: params[:square_footage],
                            year_built: params[:year_built],
                            description: params[:description],
                            listing_url: params[:listing_url]
                          )
    if @property.save
      render json: {message: 'Property created successfully'}, status: :created
    else
      render json: {errors: @property.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @property = Property.find(params[:id])
    render 'show.json.jb'  
  end

  def update
    @property = Property.find(params[:id])
    @property.realtor_id = params[:realtor_id] || @property.realtor_id
    @property.mls_number = params[:mls_number] || @property.mls_number
    @property.home_category = params[:home_category] || @property.home_category
    @property.price = params[:price] || @property.price
    @property.address = params[:address] || @property.address
    @property.bedrooms = params[:bedrooms] || @property.bedrooms
    @property.baths = params[:baths] || @property.baths
    @property.square_footage = params[:square_footage] || @property.square_footage
    @property.year_built = params[:year_built] || @property.year_built
    @property.description = params[:description] || @property.description
    @property.listing_url = params[:listing_url] || @property.listing_url
    if @property.save
      render 'show.json.jb'
    else
      render json: {errors: @property.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    render json: {message: "Successfully Destroyed Property."}  
  end



end
