class CreateAmenitizations < ActiveRecord::Migration[6.1]
  def change
    create_table :amenitizations do |t|
      t.references :listing, null: false, foreign_key: true
      t.references :amenity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
