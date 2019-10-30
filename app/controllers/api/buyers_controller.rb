class Api::BuyersController < ApplicationController

  def create
    @buyer = User.new(
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    phone: params[:phone],
                    type: params[:type],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )

    if @buyer.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: @buyer.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @buyer = User.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @buyer = User.find(params[:id])
    @buyer.first_name = params[:first_name] || @buyer.first_name
    @buyer.last_name = params[:last_name] || @buyer.last_name
    @buyer.email = params[:email] || @buyer.email
    @buyer.phone = params[:phone] || @buyer.phone
    @buyer.type = params[:type] || @buyer.type
    @buyer.password = params[:password] || @buyer.password

    if @buyer.save
      render 'show.json.jb'
    else
      render json: {errors: @buyer.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @buyer = User.find(params[:id])
    @buyer.destroy
    render json: {message: "successfully Destroyed Buyer"}
  end

end
