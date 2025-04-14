class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :isbn
      t.references :library, null: false, foreign_key: true
      t.boolean :is_available

      t.timestamps
    end
  end
end
