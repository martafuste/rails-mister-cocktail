class CocktailsController < ApplicationController

   before_action :set_cocktail, only: [:show, :edit]


  def index
    @cocktails = Cocktail.all

  end

  # GET /restaurants/1
  def show
    @dose = Dose.new
  end

  # GET /restaurants/new
  def new
    @cocktail = Cocktail.new
  end


  # def edit
  # end


  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'Your cocktail is on the way....!'
    else
      render :new
    end
  end

  # PATCH/PUT /restaurants/1
  # def update
  #   if @cocktail.update(cocktail_params)
  #     redirect_to @cocktail, notice: 'The cocktail was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  # # DELETE /restaurants/1
  # def destroy
  #   @cocktail.destroy
  #   redirect_to cocktails_url, notice: 'Your cocktail was deleted.'
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cocktail_params
      params.require(:cocktail).permit(:name, :photo)
    end
  end

