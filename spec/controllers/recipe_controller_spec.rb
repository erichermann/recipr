require 'rails_helper'

RSpec.describe RecipeController do
  context 'GET#index' do
    it 'should redirect to login page if not logged in' do
      login_with nil
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'should render the recipe index' do
      login_with create(:user)
      get :index
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  context 'GET#new' do
    it 'should redirect to login page if not logged in' do
      login_with nil
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'should render the recipe new' do
      login_with create(:user)
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template(:new)
    end
  end

  context 'POST#create' do
    it 'should redirect to login page if not logged in' do
      login_with nil
      post :create
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'should create a new recipe record with no associations' do
      login_with create(:user)

      recipe_ingredients_attr = [{ ingredient_name: 'Recipe 1, ingredient 1',
                                   _destroy: false }]
      recipe_steps_attr = [{ step_name: 'Recipe 1, step 1',
                             _destroy: false }]

      params = { title: 'test recipe 1', author: 'author 11',
                 publication_date: '2016-02-16',
                 description: 'test recipe 1 description',
                 recipe_ingredients_attributes: recipe_ingredients_attr,
                 recipe_steps_attributes: recipe_steps_attr }
      post :create, recipe: params

      expect(response.status).to eq(302)
      recipe = assigns(:recipe)
      recipe_ingr_1 = recipe.recipe_ingredients[0]
      recipe_step_1 = recipe.recipe_steps[0]
      recipe_ingredient_1_name = 'Recipe 1, ingredient 1'

      expect(recipe.title).to eq('test recipe 1')
      expect(recipe_ingr_1.ingredient_name).to eq(recipe_ingredient_1_name)
      expect(recipe_step_1.step_name).to eq('Recipe 1, step 1')
      expect(response).to redirect_to(edit_recipe_path(assigns(:recipe)))
    end

    it 'should render new on create failure' do
      login_with create(:user)

      recipe_ingredients_attr = [{ ingredient_name: 'Recipe 1, ingredient 1',
                                   _destroy: false }]
      recipe_steps_attr = [{ step_name: 'Recipe 11, step 1',
                             _destroy: false }]

      params = { title: 'test recipe 1 (updated)', author: 'author 11',
                 publication_date: '2016-02-16',
                 description: 'test recipe 1 description',
                 recipe_ingredients_attributes: recipe_ingredients_attr,
                 recipe_steps_attributes: recipe_steps_attr }

      allow_any_instance_of(Recipe).to receive(:save).and_return(false)

      post :create, recipe: params
      expect(response.status).to eq(200)
      expect(response).to render_template('recipe/new')
      expect(flash[:error]).to eq(I18n.t('recipes.recipe_create_error'))
    end
  end

  context 'POST#update' do
    it 'should redirect to login page if not logged in' do
      login_with nil
      post :update
      expect(response).to redirect_to(new_user_session_path)
    end

    describe 'successful update' do
      before do
        login_with create(:user)
      end

      context 'when updating existing data only' do
        let(:recipe) { create(:recipe) }
        let(:recipe_ingredient_1) { create(:recipe_ingredient, recipe: recipe) }
        let(:recipe_step_1) { create(:recipe_step, recipe: recipe) }

        it 'should update the recipe and nested attribute changes' do
          recipe_ingredient_name = 'Recipe 1, ingredient name 1 (updated)'
          recipe_step_name = 'Recipe 1, step 1 (updated)'
          recipe_ingredients_attr = [{ ingredient_name: recipe_ingredient_name,
                                       _destroy: false,
                                       id: recipe_ingredient_1.id }]
          recipe_steps_attr = [{ step_name: recipe_step_name,
                                 _destroy: false, id: recipe_step_1.id }]

          params = { title: "#{recipe.title} (updated)", author: recipe.author,
                     publication_date: 2.years.from_now,
                     description: "#{recipe.description} (updated)",
                     recipe_ingredients_attributes: recipe_ingredients_attr,
                     recipe_steps_attributes: recipe_steps_attr }

          post :update, id: recipe.id, recipe: params

          recipe = Recipe.find(assigns(:recipe).id)
          ingrediant_1_name = recipe.recipe_ingredients[0].ingredient_name
          expect(response.status).to eq(302)
          expect(recipe.title).to eq('Recipe 1 (updated)')
          expect(recipe.description).to eq('Recipe 1 description (updated)')
          expect(ingrediant_1_name).to eq(recipe_ingredient_name)
          expect(response).to redirect_to(edit_recipe_path(assigns(:recipe)))
        end
      end

      context 'when deleting existing nested attributes' do
        let(:recipe) { create(:recipe) }
        let(:recipe_ingred_1) { create(:recipe_ingredient, recipe: recipe) }
        let(:recipe_ingred_2) { create(:recipe_ingredient, recipe: recipe) }
        let(:recipe_step_1) { create(:recipe_step, recipe: recipe) }
        let(:recipe_step_2) { create(:recipe_step, recipe: recipe) }

        it 'should update the recipe and nested attribute changes' do
          recipe_1_ingred_name = 'Recipe 1, ingredient name 1 (updated)'
          recipe_step_name = 'Recipe 1, step 1 (updated)'
          recipe_ingredients_attr = [{ ingredient_name: recipe_1_ingred_name,
                                       _destroy: false,
                                       id: recipe_ingred_1.id },
                                     { _destroy: true, id: recipe_ingred_2.id }]
          recipe_steps_attr = [{ step_name: recipe_step_name,
                                 _destroy: false, id: recipe_step_1.id },
                               { _destroy: true, id: recipe_step_2.id }]

          params = { title: "#{recipe.title} (updated)", author: recipe.author,
                     publication_date: 2.years.from_now,
                     description: "#{recipe.description} (updated)",
                     recipe_ingredients_attributes: recipe_ingredients_attr,
                     recipe_steps_attributes: recipe_steps_attr }

          post :update, id: recipe.id, recipe: params

          recipe = Recipe.find(assigns(:recipe).id)
          ingrediant_1_name = recipe.recipe_ingredients[0].ingredient_name
          expect(response.status).to eq(302)
          expect(recipe.title).to eq('Recipe 1 (updated)')
          expect(recipe.description).to eq('Recipe 1 description (updated)')
          expect(ingrediant_1_name).to eq(recipe_1_ingred_name)
          expect(RecipeIngredient.find_by(id: recipe_ingred_2.id)).to eq(nil)
          expect(RecipeStep.find_by(id: recipe_step_2.id)).to eq(nil)
          expect(response).to redirect_to(edit_recipe_path(assigns(:recipe)))
        end
      end
    end

    describe 'failed update' do
      let(:recipe) { create(:recipe) }
      let(:recipe_ingred_1) { create(:recipe_ingredient, recipe: recipe) }
      let(:recipe_step_1) { create(:recipe_step, recipe: recipe) }

      before do
        login_with create(:user)
      end

      it 'should render edit on update failure' do
        recipe_ingredients_attr = [{ ingredient_name: 'Recipe 1, ingredient 1',
                                     _destroy: false }]
        recipe_steps_attr = [{ step_name: 'Recipe 11, step 1',
                               _destroy: false }]

        params = { title: 'test recipe 1 (updated)', author: 'author 11',
                   publication_date: '2016-02-16',
                   description: 'test recipe 1 description',
                   recipe_ingredients_attributes: recipe_ingredients_attr,
                   recipe_steps_attributes: recipe_steps_attr }

        allow_any_instance_of(Recipe).to receive(:update_attributes)
          .and_return(false)

        post :update, id: recipe.id, recipe: params
        expect(response.status).to eq(200)
        expect(response).to render_template('recipe/edit')
        flash_error = I18n.t('recipes.errors.recipe_update_error')
        expect(flash[:error]).to eq(flash_error)
      end
    end
  end

  context 'GET#edit' do
    it 'should redirect to login page if not logged in' do
      login_with nil
      get :edit
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'should render the recipe edit' do
      login_with create(:user)
      get :edit, id: create(:recipe).id
      expect(response.status).to eq(200)
      expect(response).to render_template(:edit)
    end
  end

  context 'GET#show' do
    it 'should render the recipe show page' do
      get :show, id: create(:recipe).id
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end

  context 'DELETE#destroy' do
    let(:recipe) { create(:recipe) }
    let(:recipe_ingred_1) { create(:recipe_ingredient, recipe: recipe) }
    let(:recipe_step_1) { create(:recipe_step, recipe: recipe) }

    it 'should redirect to login page if not logged in' do
      login_with nil
      delete :destroy, id: recipe.id
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'should delete the recipe and associations' do
      login_with create(:user)
      delete :destroy, id: recipe.id

      flash_message = I18n.t('recipes.info.recipe_deleted_success',
                             recipe_title: recipe.title)
      expect(flash[:info]).to eq(flash_message)
      expect(Recipe.find_by(id: recipe.id)).to eq(nil)
      expect(RecipeIngredient.find_by(recipe_id: recipe.id)).to eq(nil)
      expect(RecipeStep.find_by(recipe_id: recipe.id)).to eq(nil)
      expect(response).to redirect_to(recipe_index_path)
    end
  end
end
