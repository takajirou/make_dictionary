ActiveAdmin.register LibraryMember do

  permit_params :user_id, :library_id, :role, :joined_at

  index do
    selectable_column
    id_column
    column :user_id
    column :library_id
    column :role
    column :joined_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :library_id
      f.input :role
      f.input :joined_at
    end
    f.actions
  end

end
