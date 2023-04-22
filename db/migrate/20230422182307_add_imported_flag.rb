class AddImportedFlag < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :imported_recipe, :boolean
  end
end
