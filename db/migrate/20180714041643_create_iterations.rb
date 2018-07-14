class CreateIterations < ActiveRecord::Migration[5.1]
  def change
    create_table :iterations do |t|
      t.string :content
      t.string :recording
      t.string :comment
      t.references :musician, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
