class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_female, :boolean, default: false
    add_column :users, :birth_date, :datetime
    add_column :users, :phone, :string
    add_column :users, :university, :string
    add_column :users, :address, :text

  end
end
