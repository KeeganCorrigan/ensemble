class CreateBandMusicians < ActiveRecord::Migration[5.1]
  def change
    create_table :band_musicians do |t|
      t.references :band, foreign_key: true
      t.references :musician, foreign_key: true
      t.timestamps
    end
  end
end
