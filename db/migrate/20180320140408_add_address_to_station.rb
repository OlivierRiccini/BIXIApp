class AddAddressToStation < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :address, :string
  end
end
