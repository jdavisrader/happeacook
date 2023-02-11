class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
	before_action :authenticate_user!, only: %i[ new edit create udpate destroy ]

  # GET /recipes or /recipes.json
  def index
		@q = Recipe.ransack(params[:q])
		@recipes = @q.result(distinct: true).includes(:ingredients, :tags).page params[:page]
		# @recipes = @q.result.paginate(page: params[:page], per_page: 5)
    # @recipes = Recipe.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

	def my_recipes
		@q = Recipe.where(user_id: current_user.id).ransack(params[:q])
		@recipes = @q.result(distinct: true).includes(:ingredients, :tags).page params[:page]
	end

	def discover
		@q = Recipe.ransack(params[:q])
		@recipes = @q.result(distinct: true).includes(:ingredients, :tags).page(params[:page]).per(4)

		count = Recipe.count
		random_offset = rand(count)
		@carousel = Recipe.offset(random_offset).first(5)

		@breakfast = Tag.find_by(name: "Breakfast")
		@dinner = Tag.find_by(name: "Dinner")
		@sides = Tag.find_by(name: "Side Dishes")
		@snacks = Tag.find_by(name: "Snacks")
		@bread = Tag.find_by(name: "Bread")
		@dessert = Tag.find_by(name: "Dessert")
		@drinks = Tag.find_by(name: "Drinks")
		@christmas = Tag.find_by(name: "Christmas")
	end

	def import_recipe
	end

	def import
		doc = Nokogiri::HTML(URI.open(params["import"]["name"]))
		js = doc.at('script[type="application/ld+json"]').text
		jsParse = JSON[js]

		@recipe = Recipe.new
		@recipe.ingredients.build
		@recipe.instructions.build
		@recipe.user_id = current_user.id

		if jsParse["name"].present?
			@recipe.name = jsParse["name"]
			@recipe.description = jsParse["description"]
			@recipe.servings = jsParse["recipeYield"].first.to_i
			@recipe.prep_time = ActiveSupport::Duration.parse(jsParse["prepTime"])
			@recipe.cook_time = ActiveSupport::Duration.parse(jsParse["cookTime"])
			@recipe.calories = jsParse["nutrition"]["calories"]

			#Ingredientes
			jsParse["recipeIngredient"].each_with_index do |ingredient, index|
				@recipe.ingredients.build(name: ingredient, order_number: index)
				puts ingredient
			end
		else
			@recipe.name = jsParse[0]["name"]
			@recipe.description = jsParse[0]["description"]
			@recipe.servings = jsParse[0]["recipeYield"].first.to_i
			@recipe.prep_time = ActiveSupport::Duration.parse(jsParse[0]["prepTime"])
			@recipe.cook_time = ActiveSupport::Duration.parse(jsParse[0]["cookTime"])
			@recipe.calories = jsParse[0]["nutrition"]["calories"]

			# Ingredientes
			jsParse[0]["recipeIngredient"].each_with_index do |ingredient, index|
				@recipe.ingredients.build(name: ingredient, order_number: index)
				puts ingredient
			end
		end
		debugger
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
		if @recipe.user_id == current_user.id || current_user.super_user?
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
      params.require(:recipe).permit(:name, :user_id, :description, :servings, :prep_time, :prep_time_descriptor, :cook_time, :cook_time_descriptor, :rest_time, :rest_time_descriptor, :total_time, :total_time_descriptor, :calories, :page, :header, :tag_list, :tag, {tag_ids: []}, :tag_ids, :ingredient_id, ingredients_attributes: [:_destroy, :id, :ingredient, :order_number], instructions_attributes: [:_destroy, :id, :step_number, :step], pictures: [], original_recipe_photos: [])
    end

end
