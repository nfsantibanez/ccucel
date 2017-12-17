class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :request, null: false
      t.string :type, null: false
      t.binary :contract
      t.binary :file
      t.string :status, null: false, default: 'created'
      t.text :comment
      t.datetime :closed_at, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
