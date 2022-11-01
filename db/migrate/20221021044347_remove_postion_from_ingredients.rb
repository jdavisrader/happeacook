class RemovePostionFromIngredients < ActiveRecord::Migration[6.1]
  def change
		remove_column :ingredients, :position
  end
end
