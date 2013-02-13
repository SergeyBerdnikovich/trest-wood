class Seo < ActiveRecord::Base
  belongs_to :seo_object, polymorphic: true

  attr_accessible :keywords, :description, :seo_object_id, :seo_object_type

  def self.get_keywords_for(obj)
    seo = Seo.find_by_seo_object_type_and_seo_object_id(obj.class, obj.id)
    seo ? seo.keywords : "#{obj.title}"
  end
  def self.get_keywords_for_welcome(obj)
    seo = Seo.find_by_seo_object_type(obj.class)
    seo ? seo.keywords : 'Welcome'
  end
  def self.get_description_for_welcome(obj)
    seo = Seo.find_by_seo_object_type(obj.class)
    seo ? seo.description : 'Welcome'
  end
  def self.get_description_for(obj)
    seo = Seo.find_by_seo_object_type_and_seo_object_id(obj.class, obj.id)
    seo ? seo.description : "#{obj.title}"
  end
end
