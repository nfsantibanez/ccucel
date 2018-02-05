class CreateSims < ActiveRecord::Migration[5.1]
  def change
    create_table :sims do |t|
      t.string :phone_number, null: false
      t.string :serial_number
      t.string :country, null: false
      t.string :state, null: false, default: 'new'
      t.boolean :available, null: false, default: true
      t.binary :order
      t.string :order_name
      t.string :order_type

      t.timestamps
    end
  end
end
