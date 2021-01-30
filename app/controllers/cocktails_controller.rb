class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:edit, :show, :destroy, :update]

  def index
    @cocktails = Cocktail.all
  end

  def show; end

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

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: @cocktail.id)
  end
end
