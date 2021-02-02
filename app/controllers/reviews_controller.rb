class ReviewsController < ApplicationController

  before_action :set_cocktail, only: [:create, :edit, :update]

  def create
    @review = Review.new(params_review)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def edit; end

  def update; end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def params_review
    params.require(:review).permit(:rating, :description)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    @reviews = Review.where(cocktail_id: @cocktail.id)
  end
end
