class CombineIngredientNameAndMeasurment < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :ingredient, :string

    Ingredient.all.each do |ingredient|
      n = [ingredient.measurement, ingredient.name].join(' ')
      ingredient.update(ingredient: n)
    end

  end
end
