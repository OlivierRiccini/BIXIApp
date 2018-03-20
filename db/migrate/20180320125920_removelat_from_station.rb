class RemovelatFromStation < ActiveRecord::Migration[5.1]
  def change
    remove_column :stations, :lat
  end
end
