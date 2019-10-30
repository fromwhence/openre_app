class Api::InterestsController < ApplicationController

  def index
    @interests = Interest.all
    render 'index.json.jb'
  end

  def create
    @interest = Interest.new(
                            buyer_id: params[:buyer_id],
                            property_id: params[:property_id],
                            rating: params[:rating],
                            notes: params[:notes],
                            active: params[:active]
                            )
    if @interest.save
      render json: {message: 'Your review was created successfully'}, status: :created
    else
      render json: {errors: @interest.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @interest = Interest.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @interest = Interest.find(params[:id])
    @interest.buyer_id = params[:buyer_id] || @interest.buyer_id
    @interest.property_id = params[:property_id] || @interest.property_id
    @interest.rating = params[:rating] || @interest.rating
    @interest.notes = params[:notes] || @interest.notes
    @interest.active = params[:active] || @interest.active

    if @interest.save
      render 'show.json.jb'
    else
      render json: {errors: @intest.errors.full_messages}, status: :unprocessable_entity
    end  
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy
    render json: {message: "Successfully Destroyed Review."}
  end

end
