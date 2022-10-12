class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.integer :servings
      t.float :prep_time
      t.string :prep_time_descriptor
      t.float :cook_time
      t.string :cook_time_descriptor
      t.float :rest_time
      t.string :rest_time_descriptor
      t.float :total_time
      t.string :total_time_descriptor
      t.integer :calories

      t.timestamps
    end
  end
end
