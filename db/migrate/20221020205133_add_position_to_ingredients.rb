class AddPositionToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :position, :integer
  end
end
