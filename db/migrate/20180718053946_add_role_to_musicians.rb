class AddRoleToMusicians < ActiveRecord::Migration[5.1]
  def change
    add_column :musicians, :role, :integer, default: 0
  end
end
