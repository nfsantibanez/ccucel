class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :request, null: false
      t.string :item, null: false
      t.string :model, null: false, default: 'default'
      t.string :plan, null: false, default: 'default'
      t.binary :contract
      t.binary :file
      t.string :status, null: false, default: 'created'
      t.string :comment
      t.datetime :closed_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
