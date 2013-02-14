class Category < ActiveRecord::Base
  has_many :items, :dependent => :destroy
  has_one :seo, as: :seo_object, :dependent => :destroy

  accepts_nested_attributes_for :seo,
                                :allow_destroy => :true,
                                :reject_if => :all_blank

  attr_accessible :title, :seo_attributes

  validates :title, :presence => true,
                    :length => { :minimum => 2, :maximum => 50 },
                    :uniqueness => true
end
