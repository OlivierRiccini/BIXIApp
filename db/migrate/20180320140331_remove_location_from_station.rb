class RemoveLocationFromStation < ActiveRecord::Migration[5.1]
  def change
    remove_column :stations, :location, :string
  end
end
