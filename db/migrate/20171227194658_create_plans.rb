class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :item, null: false
      t.string :name, null: false
      t.string :detail
      t.integer :price, null: false
      t.string :category, default: 'all'
      t.string :nid_country, null:false

      t.timestamps
    end
  end
end
