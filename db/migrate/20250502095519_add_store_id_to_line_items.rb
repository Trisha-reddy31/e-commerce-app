class AddtoystoreIdToLineItems < ActiveRecord::Migration[7.2]
  def change
    add_column :line_items, :toystore_id, :integer
  end
end
