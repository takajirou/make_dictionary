class CreateLibraryMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :library_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
