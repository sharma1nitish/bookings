class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table :tables do |t|
      t.references :hall, foreign_key: true
      t.string :number
      t.boolean :is_booked

      t.timestamps
    end
  end
end
