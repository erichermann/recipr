class RecipeController < ApplicationController
  before_filter :set_params
  before_filter :authenticate_user!, except: ['show']

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: PAGINATION_PER_PAGE)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    respond_to do |format|
      if @recipe.save
        flash[:info] = t('recipes.info.recipe_create_success')
        format.html { redirect_to(redirect_to(edit_recipe_path(@recipe))) }
      else
        flash[:error] = t('recipes.recipe_create_error')
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
        flash[:info] = t('recipes.info.recipe_update_success')
        format.html { redirect_to(edit_recipe_path(@recipe)) }
      else
        flash[:error] = t('recipes.errors.recipe_update_error')
        format.html { render action: 'edit' }
      end
    end
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def destroy
    recipe = Recipe.find_by_id(params[:id])
    recipe.destroy
    respond_to do |format|
      flash[:info] = t('recipes.info.recipe_deleted_success', recipe_title: @recipe.title)
      format.html { redirect_to(recipe_index_path) }
    end
  end

  private

  def set_params
    params.permit!
  end
end
