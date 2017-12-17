class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :rut, null: false
      t.string :name, null: false
      t.string :email, null: false
      t.string :occupation, null: false
      t.string :enterprice
      t.string :supervisor, null: false
      t.string :cost_center
      t.string :job_center

      t.timestamps
    end
  end
end
