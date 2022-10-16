class Recipe < ApplicationRecord
  belongs_to :user

	has_many :ingredients, dependent: :destroy, inverse_of: :recipe
	has_many :instructions, dependent: :destroy, inverse_of: :recipe
	has_many :recipe_tags
	has_many :tags, through: :recipe_tags

	accepts_nested_attributes_for :ingredients, :instructions, allow_destroy: true, reject_if: :all_blank
	validates :name, presence:



	def self.tagged_with(name)
    Tag.find_by!(name: name).recipes
  end

  def self.tag_counts
    Tag.select('tags.*, count(recipe_tags.tag_id) as count').joins(:recipe_tags).group('recipe_tags.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
