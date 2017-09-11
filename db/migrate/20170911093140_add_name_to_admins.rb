class AddNameToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :name, :string
    add_column :admins, :surname, :string
    add_column :admins, :is_active, :boolean, default: true
    add_column :admins, :time_zone, :string, default: "UTC"

  end
end
