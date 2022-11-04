class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    dog_house = DogHouse.find(params[:id])
    render json: dog_house
  end

  def reviews_index
    dogs = DogHouse.find(params[:dog_house_id])
    review = dogs.reviews
    render json: review, include: :dog_house, status: :ok
  end

  def review
    reviews = Review.find(params[:id])
    render json: reviews, include: :dog_house, status: :ok
  end

  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
