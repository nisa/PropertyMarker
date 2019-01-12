class CreateProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :properties do |t|
      t.integer :council_property_number, limit: 8
      t.decimal :longitude
      t.decimal :latitude 
      t.references :lga
    end
  end
end
