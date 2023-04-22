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
		
		recipe_from_import = base_recipe(jsParse)

		if !recipe_from_import.nil?
			@recipe = Recipe.new
			@recipe.user_id = current_user.id

			@recipe.name = deep_find_value_with_key(recipe_from_import, "name").nil? ? "" : deep_find_value_with_key(recipe_from_import, "name")
			@recipe.description = deep_find_value_with_key(recipe_from_import, "description").nil? ? "" : deep_find_value_with_key(recipe_from_import, "description")
			@recipe.servings = deep_find_value_with_key(recipe_from_import, "recipeYield").nil? ? "" : deep_find_value_with_key(recipe_from_import, "recipeYield").first.to_i
			@recipe.prep_time = deep_find_value_with_key(recipe_from_import, "prepTime").nil? ? "" : ActiveSupport::Duration.parse(deep_find_value_with_key(recipe_from_import, "prepTime")).in_minutes
			@recipe.prep_time_descriptor = "min"
			@recipe.cook_time = deep_find_value_with_key(recipe_from_import, "cookTime").nil? ? "" : ActiveSupport::Duration.parse(deep_find_value_with_key(recipe_from_import, "cookTime")).in_minutes
			@recipe.cook_time_descriptor = "min"

			@recipe.calories = deep_find_value_with_key(recipe_from_import, "calories"),nil? ? "" : deep_find_value_with_key(recipe_from_import, "calories")


			@recipe.original_url = params["import"]["name"]
			@recipe.imported_recipe = true


			# original_author = deep_find_value_with_key(deep_find_value_with_key(recipe_from_import, "author"), "name")

			
			# Tentative Image importer
			# downloaded_image = recipe_from_import["image"]["url"].nil? ? open(recipe_from_import["image"][0]) : open(recipe_from_import["image"]["url"])
			# if !downloaded_image.nil?
			# 	@recipe.header.attach(io: downloaded_image, filename: "foo.jpg")
			# end

			#Ingredientes
			deep_find_value_with_key(recipe_from_import, "recipeIngredient").each_with_index do |ingredient, index|
				@recipe.ingredients.build(ingredient: ingredient, order_number: index)
			end

			#Instructions
			deep_find_value_with_key(recipe_from_import, "recipeInstructions").each_with_index do |instruction, index|
				@recipe.instructions.build(step: instruction["text"], step_number: index)
			end
		end

		respond_to do |format|
			if @recipe.present? && @recipe.save
			  format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
			  format.json { render :show, status: :created, location: @recipe }
			else
				format.html { redirect_to recipes_url, alert: "Unable to import Recipe. No recipe found" }
				format.json { head :no_content }
			end
		end
		
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

		def deep_find_value_with_key(data, desired_key)
			if data.kind_of?(Array)
				data.each do |value|
					if found = deep_find_value_with_key(value, desired_key)
						return found
					end
				end
			elsif data.kind_of?(Hash)
				if data.key?(desired_key)
					data[desired_key]
				else
					data.each do |key, val|
						if found = deep_find_value_with_key(val, desired_key)
							return found
						end
					end
				end
			end
		end

		def base_recipe(data)
			if data.is_a?(Hash)
				data.each do |key, value|
					if key == "@type" 
						if value.is_a?(Array)
							value.each do |item|
								if item == "Recipe"
									return data
								end
							end
						elsif value == "Recipe"
							return data
						end
					elsif value.is_a?(Hash) || value.is_a?(Array)
						found = base_recipe(value)
						return found unless found.nil?
					end
				end
			elsif data.is_a?(Array)
				data.each do |item|
					found = base_recipe(item)
					return found unless found.nil?
				end
			end
			nil
		end

end
