class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :lat1, precision: 10, scale: 6
      t.decimal :lng1, precision: 10, scale: 6
      t.decimal :lat2, precision: 10, scale: 6
      t.decimal :lng2, precision: 10, scale: 6
      t.decimal :lat3, precision: 10, scale: 6
      t.decimal :lng3, precision: 10, scale: 6
      t.decimal :lat4, precision: 10, scale: 6
      t.decimal :lng4, precision: 10, scale: 6
      t.string :image_url

      t.timestamps
    end
  end
end
