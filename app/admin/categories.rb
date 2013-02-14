# coding: utf-8
ActiveAdmin.register Category do
  form do |f|
    f.inputs "Категория" do
      f.input :title, :label => "Название"
    end
    f.inputs "SEO",
      :for => [:seo,
                if f.object.seo
                  f.object.seo
                else
                  f.object.build_seo
                end
              ] do |fm|
      fm.input :description, :for => :seo
      fm.input :keywords, :for => :seo
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :seo_description do |category|
        category.seo.description if category.seo
      end
      row :seo_keywords do |category|
        category.seo.keywords if category.seo
      end
      row :created_at
      row :updated_at
      row :items do |category|
        category.items.each do |item|
          ul
            li link_to item.title, admin_item_path(item)
        end
      end
    end
    active_admin_comments
  end
end