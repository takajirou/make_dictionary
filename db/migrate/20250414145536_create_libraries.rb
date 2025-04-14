class CreateLibraries < ActiveRecord::Migration[8.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :description
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
