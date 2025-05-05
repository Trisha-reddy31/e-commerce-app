class AddStoreIdToToystores < ActiveRecord::Migration[7.2]
  def change
    add_column :toystores, :store_id, :integer
  end
end
