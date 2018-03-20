class AddLatToStation < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :lat, :float
  end
end
