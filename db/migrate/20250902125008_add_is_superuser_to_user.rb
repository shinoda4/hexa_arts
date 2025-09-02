class AddIsSuperuserToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :is_superuser, :boolean
  end
end
