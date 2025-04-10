class CreateRentals < ActiveRecord::Migration[8.0]
  def change
    create_table :rentals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.datetime :borrowed_at,  default: -> { 'CURRENT_TIMESTAMP' }
      t.date :due_date, null: false
      t.datetime :returned_at

      t.timestamps
    end
  end
end
