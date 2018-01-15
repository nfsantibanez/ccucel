class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :n_request
      t.string :request, null: false
      t.string :item, null: false
      t.string :model, null: false, default: 'default'
      t.string :plan, null: false, default: 'default'
      t.binary :contract
      t.binary :file
      t.string :status, null: false, default: 'created'
      t.string :comment
      t.string :comment_stolen_lost
      t.string :email_sended
      t.boolean :want_replacement
      t.boolean :want_sim
      t.boolean :want_new_number
      t.string :number_type
      t.string :phone_number
      t.string :transfer_line_type
      t.string :price
      t.string :region
      t.string :country
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :closed_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
