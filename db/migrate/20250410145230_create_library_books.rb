class CreateLibraryBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :library_books do |t|
      t.string :title, null: false
      t.string :author
      t.text :description
      t.string :isbn
      t.references :library, null: false, foreign_key: true
      t.boolean :is_available, default: true

      t.timestamps
    end
  end
end
