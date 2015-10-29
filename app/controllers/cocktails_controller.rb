class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end
  def new
    @cocktail = Cocktail.new
  end
  def create
    @cocktail = Cocktail.new(cocktails_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end
  def show
    find_cocktail
  end


  private

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
