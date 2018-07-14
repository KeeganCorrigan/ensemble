class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.references :band, foreign_key: true
      t.string :title
      t.string :timing
      t.string :genre
      t.string :status

      t.timestamps
    end
  end
end
