class Items < ActiveRecord::Base
  belongs_to :category
  has_many :galleries, :dependent => :destroy

  accepts_nested_attributes_for :galleries,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :coast, :description, :material, :title, :category_id, :galleries_attributes
end
