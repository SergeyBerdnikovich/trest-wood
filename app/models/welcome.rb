class Welcome < ActiveRecord::Base
  has_one :seo, as: :seo_object, :dependent => :destroy

  attr_accessible :content

  validates :content, :presence => true,
                      :uniqueness => true
end
