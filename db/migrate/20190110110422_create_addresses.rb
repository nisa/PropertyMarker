class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
  	create_table :addresses, id: :uuid do |t|
      t.string :state
      t.integer :postcode
      t.string :full_address
      t.references :property
      t.references :feature
      t.references :lga
    end
  end
end
