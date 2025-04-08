ActiveAdmin.register Author do
  permit_params :name
  
  index do
    selectable_column
    id_column
    column :name
    column "書籍数" do |author|
      author.books.count
    end
    column :created_at
    actions
  end
  
  filter :name
  filter :created_at
  
  show do
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
    end
    
    panel "著書一覧" do
      table_for author.books do
        column :title
        column :published_date
        column :actions do |book|
          link_to "表示", admin_book_path(book)
        end
      end
    end
  end
end