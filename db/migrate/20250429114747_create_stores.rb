class Createstores < ActiveRecord::Migration[7.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :brand
      t.float :price
      t.string :toytype
      t.text :description

      t.timestamps
    end
  end
end
