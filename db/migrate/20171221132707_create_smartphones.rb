class CreateSmartphones < ActiveRecord::Migration[5.1]
  def change
    create_table :smartphones do |t|
      t.string :model, null: false
      t.string :category, null: false
      t.string :last_owner, null: false, default: 'first owner'
      t.string :imei, null: false
      t.integer :price, null: false
      t.string :state, null: false, default: 'new'
      t.boolean :available, null: false, default: true
      t.datetime :last_assign_at, null: false, default: DateTime.now
      t.references :sim, foreign_key: true

      t.timestamps
    end
  end
end
