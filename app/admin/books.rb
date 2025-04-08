ActiveAdmin.register Book do
  # 編集可能なパラメータを設定
  permit_params :title, :published_date, :info_link, :image_link, :systemid, :user_id

  # 一覧表示のカラム設定
  index do
    selectable_column
    id_column
    column :title
    column :published_date
    column :systemid
    column :user
    column :created_at
    actions
  end

  # フィルター設定
  filter :title
  filter :systemid
  filter :published_date
  filter :user
  filter :created_at

  # 詳細表示のカスタマイズ
  show do
    attributes_table do
      row :id
      row :title
      row :published_date
      row :info_link
      row :systemid
      row :user
      row :created_at
      row :updated_at
      row :image do |book|
        if book.image_link.present?
          image_tag book.image_link, height: "100"
        end
      end
      # 著者一覧を表示
      panel "著者一覧" do
        table_for book.authors do
          column :name
        end
      end
    end
  end

  # フォームカスタマイズ
  form do |f|
    f.inputs "書籍情報" do
      f.input :title
      f.input :published_date
      f.input :info_link
      f.input :image_link
      f.input :systemid
      f.input :user
    end
    f.actions
  end
end
