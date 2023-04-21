class AddOriginalUrlToRecipe < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :original_url, :string
  end
end
