class ManageRecipesController < ApplicationController
    before_action :set_recipe, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, only: %i[ new edit create udpate destroy ]
  
    # GET /recipes or /recipes.json
    def index
        @recipes = Recipe.all
    end
  
    # DELETE /recipes/1 or /recipes/1.json
    def destroy
        if @recipe.user_id == current_user.id
            @recipe.destroy

            respond_to do |format|
            format.html { redirect_to manage_recipes_url, notice: "Recipe was successfully destroyed." }
            format.json { head :no_content }
            end
        else
            redirect_to @recipe, notice: "You do not have permission to delete this recipe"
        end
    end
  
    private
        # Use callbacks to share common setup or constraints between actions.
        def set_recipe
            @recipe = Recipe.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def recipe_params
            params.require(:recipe).permit(:name, :user_id, :description, :servings, :prep_time, :prep_time_descriptor, :cook_time, :cook_time_descriptor, :rest_time, :rest_time_descriptor, :total_time, :total_time_descriptor, :calories, :page, :header, :tag_list, :tag, {tag_ids: []}, :tag_ids, :ingredient_id, ingredients_attributes: [:_destroy, :id, :ingredient, :order_number], instructions_attributes: [:_destroy, :id, :step_number, :step], pictures: [], original_recipe_photos: [])
        end

  end
  