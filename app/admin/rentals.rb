ActiveAdmin.register Rental do

  permit_params :user_id, :book_id, :borrowed_at, :due_date

  index do
    selectable_column
    id_column
    column :user_id
    column :book_id
    column :borrowed_at
    column :due_date
    actions
  end

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :book_id
      f.input :borrowed_at
      f.input :due_date
    end
    f.actions
  end
end
