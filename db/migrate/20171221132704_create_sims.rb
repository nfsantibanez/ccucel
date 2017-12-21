class CreateSims < ActiveRecord::Migration[5.1]
  def change
    create_table :sims do |t|
      t.integer :phone_number, null: false
      t.string :last_owner, null: false, default: 'first owner'
      t.string :state, null: false, default: 'new'
      t.boolean :available, null: false, default: true
      t.datetime :last_assign_at, null: false, default: DateTime.now

      t.timestamps
    end
  end
end
