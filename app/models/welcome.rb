class Welcome < ActiveRecord::Base
  has_one :seo, as: :seo_object, :dependent => :destroy

  accepts_nested_attributes_for :seo,
                                :allow_destroy => :true,
                                :reject_if => :all_blank

  attr_accessible :content, :seo_attributes

  validates :content, :presence => true,
                      :uniqueness => true
end
