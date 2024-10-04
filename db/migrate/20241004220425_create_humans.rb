class CreateHumans < ActiveRecord::Migration[7.0]
  def change
    create_table :humans do |t|
      t.string :name
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :lng, precision: 10, scale: 6
      t.datetime :location_last_updated

      t.timestamps
    end
  end
end
