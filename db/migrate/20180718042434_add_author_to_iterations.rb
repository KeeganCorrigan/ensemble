class AddAuthorToIterations < ActiveRecord::Migration[5.1]
  def change
    add_column :iterations, :author, :string
  end
end
