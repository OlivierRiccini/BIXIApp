class AddLongitudeToStation < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :longitude, :float
  end
end