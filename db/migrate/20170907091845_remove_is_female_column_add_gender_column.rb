class RemoveIsFemaleColumnAddGenderColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :is_female
    add_column :users, :gender, :integer
  end
end
