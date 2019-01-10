class CreateLgas < ActiveRecord::Migration[5.2]
  def change
    create_table :lgas, id: :uuid do |t|
      t.string :code
      t.string :name
      t.string :long_name
    end
  end
end
