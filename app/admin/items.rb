# coding: utf-8
ActiveAdmin.register Item do
  form do |f|
    f.inputs "Категория" do
      f.select("category_id", Category.all.collect {|p| [ p.title, p.id ] }, { :include_blank => false })
    end
    f.inputs "Продукция" do
      f.input :title, :label => "Название"
      f.input :description, :label => "Описание"
      f.input :coast, :label => "Цена"
      f.input :material, :label => "Материал"
    end
    f.inputs "Фото",
      :for => [:galleries,
                if f.object.galleries.blank?
                  f.object.galleries.build
                else
                  f.object.galleries
                end
              ] do |fm|
      fm.input :image, :as => :file,
                       :hint => fm.template.image_tag(fm.object.image.url)
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :category do |item|
        link_to item.category.title, admin_category_path(item.category) if item.category
      end
      row :title
      row :description
      row :material
      row :coast
      row :created_at
      row :updated_at
      row :images do |item|
        render :partial => "/admin/gallery", :locals => { :obj => item } unless item.galleries.blank?
      end
    end
    active_admin_comments
  end
end