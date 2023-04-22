class RemoveNameAndMeasurement < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :name
    remove_column :ingredients, :measurement
  end
end
