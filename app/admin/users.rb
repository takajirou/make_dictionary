ActiveAdmin.register User do
  permit_params :name, :email, :encrypted_password, :created_at

  index do
    selectable_column
    id_column
    column :name
    column :email
    column :encrypted_password
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :encrypted_password
      f.input :created_at
    end
    f.actions
  end
end