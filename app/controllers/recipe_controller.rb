class RecipeController < ApplicationController
  before_filter :authenticate_user!, :set_params

  def index
    binding.pry
    @recipes = Recipe.paginate(page:  params[:page], per_page: PAGINATION_PER_PAGE)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to(redirect_to(edit_recipe_path(@recipe))) }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
  end

  def update
    @recipe = Recipe.find_by_id(params[:id])
    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(edit_recipe_path(@recipe)) }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to(recipe_index_path) }
    end
  end

  private

  def set_params
    params.permit!

    #params.require(:session).permit(:email, :password)
  end
end
