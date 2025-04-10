ActiveAdmin.register LibraryBook do

  permit_params :title, :author, :description, :isbn, :is_available, :library_id

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :description
    column :isbn
    column :is_available
    column :library_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :author
      f.input :description
      f.input :isbn
      f.input :is_available
      f.input :library_id
    end
    f.actions
  end
  
end
