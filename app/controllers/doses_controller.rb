class DosesController < ApplicationController

  before_action :set_cocktail, only: [:create, :edit, :update]

  def create
    @dose = Dose.new(params_dose)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def edit; end

  def update; end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktail_path(params[:cocktail_id])
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = Dose.where(cocktail_id: @cocktail.id)
  end
end
