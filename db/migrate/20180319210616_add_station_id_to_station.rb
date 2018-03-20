class AddStationIdToStation < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :station_id, :string
  end
end
