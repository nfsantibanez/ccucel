class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :item, null: false
      t.string :plan_type, null: false
      t.string :name, null: false
      t.string :detail
      t.integer :price, defaul: 0
      t.string :category, default: 'ALL'
      t.string :country, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
