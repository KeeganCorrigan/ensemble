class CreateMusicians < ActiveRecord::Migration[5.1]
  def change
    create_table :musicians do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :profile
      t.string :instrument
    end
  end
end
