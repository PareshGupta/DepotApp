class RatingsController < ApplicationController

  def create
    product = Product.find(params['product_id'])
    rating = Rating.where(user_id: session[:user_id], product_id: params[:product_id]).first_or_initialize
    rating.score = params[:score]
      
    # rating = Rating.where(user_id: session[:user_id], product_id: params[:product_id]).first
    # if rating
    #   rating.score = params[:score]
    # else
    #   rating = Rating.new(product_id: params['product_id'], user_id: session[:user_id], score: params[:score])
    # end
    respond_to do |format|
      if rating.save
        format.js { render json: {success: true, average_rating: product.average_rating} }
      else
        format.js { render json: {success: false}}
      end
    end
  end

end
