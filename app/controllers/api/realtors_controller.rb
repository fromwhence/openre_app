class Api::RealtorsController < ApplicationController

  def index
    @realtors = Realtor.all
    render 'index.json.jb'
  end

  def create
    @realtor = Realtor.new(
                        first_name: params[:first_name],
                        last_name: params[:last_name],
                        brokerage: params[:brokerage],
                        email: params[:email],
                        phone: params[:phone],
                        photo_url: params[:photo_url],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation]
                        )

    if @realtor.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: @realtor.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @realtor = Realtor.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @realtor = Realtor.find(params[:id])
    @realtor.first_name = params[:first_name] || @realtor.first_name
    @realtor.last_name = params[:last_name] || @realtor.last_name
    @realtor.brokerage = params[:brokerage] || @realtor.brokerage
    @realtor.email = params[:email] || @realtor.email
    @realtor.phone = params[:phone] || @realtor.phone
    @realtor.photo_url = params[:photo_url] || @realtor.photo_url
    @realtor.password = params[:password] || @realtor.password

    if @realtor.save
      render 'show.json.jb'
    else
      render json: {errors: @realtor.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @realtor = Realtor.find(params[:id])
    @realtor.destroy
    render json: {message: "Successfully Destroyed Realtor."}
  end

end
