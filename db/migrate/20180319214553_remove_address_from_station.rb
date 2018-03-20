class RemoveAddressFromStation < ActiveRecord::Migration[5.1]
  def change
    remove_column :stations, :address, :string
  end
end
