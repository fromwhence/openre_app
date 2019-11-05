class Api::PhotosController < ApplicationController

def index
  @photos = Photo.all
  render 'index.json.jb'
end

def create
  @photo = Photo.new(
                      property_id: params[:property_id],
                      image_url: params[:image_url]
                      )
  if @photo.save
    render json: {message: 'Photo created successfully'}, status: :created
  else
    render json: {errors: @photo.errors.full_messages}, status: :bad_request
  end
end

def show
  @photo = Photo.find(params[:id])
  render 'show.json.jb'
end

def update
  @photo = Photo.find(params[:id])
  @photo.property_id = params[:property_id] || @photo.property_id
  @photo.image_url = params[:image_url] || @photo.url

  if @photo.save
    render 'show.json.jb'
  else
    render json: {errors: @photo.errors.full_messages}, status: :unprocessable_entity
  end
end

def destroy
  @photo = Photo.find(params[:id])
  @photo.destroy
  render json: {message: "successfully Destroyed Photo."}
end


end
