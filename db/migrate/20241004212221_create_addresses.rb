class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address_string
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
