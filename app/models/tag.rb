class Tag < ApplicationRecord
	has_many :recipe_tags
	has_many :recipes, through: :recipe_tags
	validates :name, uniqueness: true, presence: true
	before_save :titleize_name

	def titleize_name
		self.name = self.name.titleize
	end
end
