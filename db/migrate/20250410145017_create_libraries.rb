class CreateLibraries < ActiveRecord::Migration[8.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :description
      t.references :owner, foreign_key:{ to_table: :users }, null: false

      t.timestamps
    end
  end
end
