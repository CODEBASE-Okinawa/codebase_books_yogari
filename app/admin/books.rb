ActiveAdmin.register Book do
  permit_params :title, :cover_image

  form(:html => { :multipart => true }) do |f|
    f.inputs "Books" do
      f.input :title
      f.input :cover_image, as: :file
    end
    f.actions
  end

  index default: true do
    id_column
    column "Cover Image" do |book|
      image_tag(book.cover_image.url, size: "50x70") unless book.cover_image.url.nil?
    end
    column :title
  end

  show do |item_image|
    attributes_table do
      row :title
      # show画面で画像を表示するためのタグを追加
      row :cover_image do
        image_tag(book.cover_image.url) unless book.cover_image.url.nil?
      end
    end
  end
end
