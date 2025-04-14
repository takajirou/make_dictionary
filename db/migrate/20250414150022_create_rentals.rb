class CreateRentals < ActiveRecord::Migration[8.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.timestamp :borrowed_at
      t.date :due_data
      t.timestamp :returned_at

      t.timestamps
    end
  end
end
