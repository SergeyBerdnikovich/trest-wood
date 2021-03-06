# coding: utf-8
ActiveAdmin.register Contact do
  index do
    column 'Ид', :id
    column 'Контакты', :content
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  show do
    attributes_table do
      row :id
      row :created_at
      row :updated_at
      row :content do |contact|
        TunedSanitize::for_(contact.content).html_safe
      end
    end
    active_admin_comments
  end

  form :partial => "contact_form"

  controller do
    def create
      params[:contact][:content] = TunedSanitize::for_(params[:contact][:content])
      create!
    end
    def update
      params[:contact][:content] = TunedSanitize::for_(params[:contact][:content])
      update!
    end
  end
end