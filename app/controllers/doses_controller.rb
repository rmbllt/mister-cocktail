class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create ]
  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end
  def create
    @dose = @cocktail.doses.build(doses_params)
    if @dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to :back
  end


private

  def doses_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
