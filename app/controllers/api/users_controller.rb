class Api::UsersController < ApplicationController
  def create
    @user = User.new(
                    first_name: params[:first_name],
                    last_name: params[:last_name],
                    brokerage: params[:brokerage],
                    email: params[:email],
                    phone: params[:phone],
                    type: params[:type],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )

    if user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @user = User.find(params[:id])
    render 'show.json.jb'  
  end
  
end
