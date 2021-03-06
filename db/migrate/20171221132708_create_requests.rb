class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :n_request
      t.string :request, null: false
      t.string :item, null: false
      t.string :model, null: false, default: 'default'
      t.string :plan, null: false, default: 'default'
      t.string :classification, null: false, default: 'abierto'
      t.binary :contract
      t.string :contract_type
      t.string :contract_name
      t.binary :file
      t.string :file_type
      t.string :file_name
      t.string :status, null: false, default: 'pendiente aprobacion'
      t.text :comment
      t.text :comment_stolen_lost
      t.text :email_sended
      t.boolean :want_replacement
      t.boolean :want_sim
      t.boolean :want_new_number
      t.string :number_type
      t.string :phone_number
      t.string :transfer_line_type
      t.string :price, default: '0'
      t.string :price_plan, default: '0'
      t.string :region
      t.string :country
      t.string :name
      t.string :national_id
      t.string :email
      t.string :company
      t.string :deptname
      t.datetime :start_date
      t.datetime :end_date
      t.datetime :closed_at
      t.string :link, default: ''
      t.string :sup_approval, default: 'pendiente'
      t.text :comment_sup, default: ""
      t.string :purchase_order, default: "pendiente"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
