ActiveAdmin.register BookAuthor do
  permit_params :book_id, :author_id
  
  index do
    selectable_column
    id_column
    column :book
    column :author
    column :created_at
    actions
  end
  
  filter :book
  filter :author
  filter :created_at
end