class AddLocationToStation < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :location, :string
  end
end
