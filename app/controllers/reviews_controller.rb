class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    puts "ready to create a review, sir yes sir"
    puts params
    @review = Review.new(review_params)
    @review.product_id = params["product_id"]
    @review.user_id = current_user.id

    if @review.save
      redirect_to [:products], notice: 'Thanks for your reivew 😻!'
    else
      redirect_to [:cart]
    end

  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to [:products], notice: 'Review deleted!'
  end

private

  def review_params
  params.require(:review).permit(
    :rating,
    :description,
    :product_id
  )
  end
end

