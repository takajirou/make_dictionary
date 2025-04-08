class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :info_link
      t.string :systemid
      t.string :published_date
      t.string :image_link

      t.timestamps
    end
  end
end
