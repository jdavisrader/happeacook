class Recipe < ApplicationRecord
  belongs_to :user
	
	has_many :ingredients, dependent: :destroy, inverse_of: :recipe
	has_many :instructions, dependent: :destroy, inverse_of: :recipe

	accepts_nested_attributes_for :ingredients, :instructions, allow_destroy: true, reject_if: :all_blank
	validates :name, presence: true
end
