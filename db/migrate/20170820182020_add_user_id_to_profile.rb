class AddUserIdToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :user_id, :integer
  end
end
