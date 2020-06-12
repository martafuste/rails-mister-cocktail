class DosesController < ApplicationController
# there is no new, bc its nested in the cocktail
def new
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new
end

def create
    # grabbing id of the parent and creating  the dose intance with strong params
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(strong_params)
    @dose.cocktail_id = @cocktail.id

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def strong_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
