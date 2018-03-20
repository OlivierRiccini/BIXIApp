class AddStationIdFromApiToStation < ActiveRecord::Migration[5.1]
  def change
    remove_column :station, :address
  end
end
