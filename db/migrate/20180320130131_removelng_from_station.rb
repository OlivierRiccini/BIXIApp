class RemovelngFromStation < ActiveRecord::Migration[5.1]
  def change
    remove_column :stations, :lng
  end
end
