class CreateBands < ActiveRecord::Migration[5.1]
  def change
    create_table :bands do |t|
      t.string :name
      t.string :username
      t.string :email
      t.string :profile
      t.string :password_digest

      t.timestamps
    end
  end
end
