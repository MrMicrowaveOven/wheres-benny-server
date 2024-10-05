class AddLocationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :humans, :location, index: true
  end
end
