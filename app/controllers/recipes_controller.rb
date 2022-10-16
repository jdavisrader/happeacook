class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]

  # GET /recipes or /recipes.json
  def index
		@q = Recipe.ransack(params[:q])
		@recipes = @q.result(distinct: false)
    # @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
		@recipe.ingredients.build
		@recipe.instructions.build
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
		@recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
		if @recipe.user_id == current_user.id
	    respond_to do |format|
	      if @recipe.update(recipe_params)
	        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
	        format.json { render :show, status: :ok, location: @recipe }
	      else
	        format.html { render :edit, status: :unprocessable_entity }
	        format.json { render json: @recipe.errors, status: :unprocessable_entity }
	      end
	    end
		else
			redirect_to @recipe, notice: "You do not have permission to udpate this recipe"
		end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
		if @recipe.user_id == current_user.id
	    @recipe.destroy

	    respond_to do |format|
	      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
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
      params.require(:recipe).permit(:name, :user_id, :description, :servings, :prep_time, :prep_time_descriptor, :cook_time, :cook_time_descriptor, :rest_time, :rest_time_descriptor, :total_time, :total_time_descriptor, :calories, :tag_list, :tag, {tag_ids: []}, :tag_ids, :ingredient_id, ingredients_attributes: [:_destroy, :id, :name, :measurement, :order_number], instructions_attributes: [:_destroy, :id, :step_number, :step])
    end
end
