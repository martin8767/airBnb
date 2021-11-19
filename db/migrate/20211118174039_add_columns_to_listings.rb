class AddColumnsToListings < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :top_amount_people, :integer
    add_column :listings, :location, :string
    add_column :listings, :price_per_night, :float
    add_column :listings, :description, :string
  end
end
