class ChangeDataTypeForIsFemale < ActiveRecord::Migration[5.1]
  def change
    change_column(:users, :is_female, :enum)
  end
end
