class RecipeController < ApplicationController
  before_filter :set_params
  before_filter :authenticate_user!, except: ['show']

  def index
    @recipes = Recipe.paginate(page: params[:page],
                               per_page: PAGINATION_PER_PAGE)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:info] = t('recipes.info.recipe_create_success')
      redirect_to(edit_recipe_path(@recipe))
    else
      flash[:error] = t('recipes.recipe_create_error')
      render action: 'new'
    end
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
  end

  def update
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe.update_attributes(params[:recipe])
      flash[:info] = t('recipes.info.recipe_update_success')
      redirect_to(edit_recipe_path(@recipe))
    else
      flash[:error] = t('recipes.errors.recipe_update_error')
      render action: 'edit'
    end
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def destroy
    recipe = Recipe.find_by_id(params[:id])
    recipe.destroy
    flash[:info] = t('recipes.info.recipe_deleted_success',
                     recipe_title: recipe.title)
    redirect_to(recipe_index_path(page: params[:page]))
  end

  private

  def set_params
    params.permit!
  end
end
