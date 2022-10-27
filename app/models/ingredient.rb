class Ingredient < ApplicationRecord
  belongs_to :recipe, inverse_of: :ingredients
	before_save :titleize_name

	def titleize_name
		self.name = self.name.titleize
	end

end
