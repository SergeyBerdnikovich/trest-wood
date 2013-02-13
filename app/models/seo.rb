class Seo < ActiveRecord::Base
  belongs_to :seo_object, polymorphic: true

  attr_accessible :keywords, :description, :seo_object_id, :seo_object_type

  def self.get_keywords_for(obj)
    seo = Seo.find_by_seo_object_type_and_seo_object_id(obj.class, obj.id)
    if seo.seo_object_type == 'Welcome'
      seo ? seo.keywords : 'Welcome'
    else
      seo ? seo.keywords : "#{obj.title}"
    end
  end
  def self.get_description_for(obj)
    seo = Seo.find_by_seo_object_type_and_seo_object_id(obj.class, obj.id)
    if seo.seo_object_type == 'Welcome'
      seo ? seo.description : 'Welcome'
    else
      seo ? seo.description : "#{obj.title}"
    end
  end
end
