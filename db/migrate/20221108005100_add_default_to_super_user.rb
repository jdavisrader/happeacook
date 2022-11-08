class AddDefaultToSuperUser < ActiveRecord::Migration[6.1]
  def change
		change_column :users, :super_user, :boolean, :default => false
  end
end
