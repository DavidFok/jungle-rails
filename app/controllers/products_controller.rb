class ProductsController < ApplicationController
  helper_method :rate_calc, :blank_stars

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @star_count = rate_calc(@product.reviews)
    @blank_count = 5 - @star_count
    @review = Review.create({product: @product})
  end

private

  def rate_calc(reviews)
    if reviews.length == 0
      return 0
    end
    rating_sum = (reviews.map { |r| r.rating }).sum
    return rating_sum / reviews.length
  end

end
