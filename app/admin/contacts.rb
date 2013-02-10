# coding: utf-8
ActiveAdmin.register Contacts do
  index do
    column 'Ид', :id
    column 'Контакты', :contacts
    column 'Создан', :created_at
    column 'Обновлён', :updated_at

    default_actions
  end

  show do
    attributes_table do
      row :id
      row :created_at
      row :updated_at
      row :contacts do |contacts|
        News.sanitize_contacts(contacts.contacts).html_safe
      end
    end
    active_admin_comments
  end

  form :partial => "contacts_form"

  controller do
    def create
      params[:contacts][:contacts] = News.sanitize_news(params[:contacts][:contacts])
      create!
    end
    def update
      params[:contacts][:contacts] = News.sanitize_news(params[:contacts][:contacts])
      update!
    end
  end
end