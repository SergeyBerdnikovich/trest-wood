# coding: utf-8
ActiveAdmin.register Seo do
  form :partial => "seo_form"

  index do
    column :id
    column 'Объект', :seo_object_id do |seo|
      seo.seo_object.class == Welcome ? 'Главная' : seo.seo_object.title
    end
    column 'Тип', :seo_object_type
    column 'Описание', :description
    column 'Ключ. слова', :keywords
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  controller do
    def create
      if params[:item_id].to_i > 0
        create_seo_for(Item.find(params[:item_id]))
      elsif params[:category_id].to_i > 0
        create_seo_for(Category.find(params[:category_id]))
      elsif params[:welcome_id].to_i > 0
        create_seo_for(Welcome.last)
      else
        redirect_to admin_seos_path
      end
    end
    def update
      if params[:item_id].to_i > 0
        update_seo_for(Item.find(params[:item_id]))
      elsif params[:category_id].to_i > 0
        update_seo_for(Category.find(params[:category_id]))
      elsif params[:welcome_id].to_i > 0
        update_seo_for(Welcome.last)
      else
        update!
      end
    end

    private
    def update_seo_for(obj)
      params[:seo][:seo_object_id] = obj.id
      params[:seo][:seo_object_type] = obj.class.to_s
      update!
    end
    def create_seo_for(obj)
      params[:seo][:seo_object_id] = obj.id
      params[:seo][:seo_object_type] = obj.class.to_s
      create!
    end
  end
end