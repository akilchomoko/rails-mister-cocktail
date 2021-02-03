class CocktailsController < ApplicationController

  require 'open-uri'

  before_action :set_cocktail, only: [:edit, :show, :destroy, :update]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    @review = Review.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    default_image if @cocktail.photo.attachment.nil?
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
    params.require(:cocktail).permit(:name, :instructions, :photo_url, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    # @doses = Dose.where(cocktail_id: @cocktail.id)
    @doses = @cocktail.doses
    @reviews = @cocktail.reviews
    # @reviews = Review.where(cocktail_id: @cocktail.id)
    @score = @cocktail.avg_score
  end

  def avg_score_x
    sum = 0
    @reviews.each { |review| sum += review.rating }
    @reviews.count.positive? ? sum / @reviews.count : sum
  end

  def default_image
    file = URI.open('https://res.cloudinary.com/dr4pzn94d/image/upload/v1612376373/kamila-maciejewska-UBX5-_ajTXw-unsplash_eo62cn.jpg')
    @cocktail.photo.attach(io: file, filename: 'default.jpg', content_type: 'image/jpg')
  end
end
