class CreateUserRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :user_records do |t|
      t.references :smartphone, foreign_key: true
      t.references :sim, foreign_key: true
      t.references :bam, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
