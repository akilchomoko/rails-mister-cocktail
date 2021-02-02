class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:edit, :show, :destroy, :update]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :show
    end
  end

  def edit; end

  def update
    @cocktail.update(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail.delete
    redirect_to cocktails_path
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name, :instructions, :photo_url)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: @cocktail.id)
    @reviews = Review.where(cocktail_id: @cocktail.id)
    @score = avg_score
  end

  def avg_score
    sum = 0
    @reviews.each { |review| sum += review.rating }
    @reviews.count.positive? ? sum / @reviews.count : sum
  end
end
