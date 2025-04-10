ActiveAdmin.register Library do

  permit_params :name, :description, :owner_id, :created_at

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :owner_id
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :owner_id
      f.input :created_at
    end
    f.actions
  end
end

