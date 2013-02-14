# coding: utf-8
ActiveAdmin.register Welcome do
  index do
    column 'Ид', :id
    column 'Содержание', :content
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  show do
    attributes_table do
      row :id
      row :created_at
      row :updated_at
      row :seo_description do |welcome|
        welcome.seo.description if welcome.seo
      end
      row :seo_keywords do |welcome|
        welcome.seo.keywords if welcome.seo
      end
      row :content do |welcome|
        TunedSanitize::for_(welcome.content).html_safe
      end
    end
    active_admin_comments
  end

  form :partial => "welcome_form"

  controller do
    def new
      @welcome = Welcome.new
      @welcome.build_seo
    end
    def edit
      @welcome = Welcome.find(params[:id])
      @welcome.build_seo
    end
    def create
      params[:welcome][:content] = TunedSanitize::for_(params[:welcome][:content])
      create!
    end
    def update
      params[:welcome][:content] = TunedSanitize::for_(params[:welcome][:content])
      update!
    end
  end
end