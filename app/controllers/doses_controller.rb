class DosesController < ApplicationController
# there is no new, bc its nested in the cocktail

  def create
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new(dose_params)
  @dose.cocktail_id = @cocktail.id

  if @dose.saveredirect_to cocktail_path(@cocktail)
  else
    render 'cocktails/show'
  end

  private

  def strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
  end
end
