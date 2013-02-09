# coding: utf-8
ActiveAdmin.register Gallery do
  index do
    column :id
    column :image do |gallery|
      image_tag gallery.image.url(:small)
    end
    column 'Имя', :image_file_name
    column 'Размер', :image_file_size
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  form do |f|
    f.inputs "Продукция" do
      f.select("items_id", Items.all.collect {|p| [ p.title, p.id ] }, { :include_blank => true })
    end
    f.inputs "Фото", :multipart => true do
      f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:normal))
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :items do |gallery|
        link_to gallery.items.title, admin_item_path(gallery.items) if gallery.items
      end
      row :image_file_name
      row :image_content_type
      row :image_file_size
      row :created_at
      row :updated_at
      row :image do
        image_tag gallery.image.url(:normal)
      end
    end
    active_admin_comments
  end
end
