class CreateBams < ActiveRecord::Migration[5.1]
  def change
    create_table :bams do |t|
      t.string :model, null: false
      t.string :code, null: false
      t.string :country, null: false
      t.string :imei, null: false, default: '000000000000000'
      t.integer :price, null: false
      t.string :state, null: false, default: 'new'
      t.binary :order
      t.string :order_name
      t.string :order_type
      t.boolean :available, null: false, default: true
      t.datetime :renovation_at

      t.timestamps
    end
  end
end
