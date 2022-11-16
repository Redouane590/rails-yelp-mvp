class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(reviews_params)
    @review.restaurant = @restaurant
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end

  private

  def reviews_params
    params.require(:review).permit(:content, :rating)
  end
end
# {"authenticity_token"=>"[FILTERED]", "review"=>{"content"=>"", "rating"=>""}, "commit"=>"Create Review", "restaurant_id"=>"3"}
