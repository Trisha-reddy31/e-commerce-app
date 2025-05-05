class Change < ActiveRecord::Migration[7.2]
  def change
    rename_column :toystores ,:type, :toytype
  end
end
