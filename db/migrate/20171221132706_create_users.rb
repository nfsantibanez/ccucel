class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :national_id, null: false
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :nid_country, null: false
      t.string :jobtitle, null: false
      t.string :company, null:false
      t.string :supervisor, null: false
      t.string :supervisor_email, null: false
      t.string :jobcode, null: false
      t.string :location, null: false
      t.string :deptname, null: false
      t.string :business_unit
      t.references :smartphone, foreign_key: true
      t.references :bam, foreign_key: true
      t.references :sim, foreign_key: true

      t.timestamps
    end
  end
end
