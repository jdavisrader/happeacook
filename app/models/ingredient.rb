class Ingredient < ApplicationRecord
  belongs_to :recipe, inverse_of: :ingredients
	before_save :titleize_name

	def titleize_name
		self.ingredient = self.ingredient.titleize
	end

end
