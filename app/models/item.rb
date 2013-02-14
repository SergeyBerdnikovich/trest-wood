class Item < ActiveRecord::Base
  belongs_to :category
  has_many :galleries, :dependent => :destroy
  has_one :seo, as: :seo_object, :dependent => :destroy

  accepts_nested_attributes_for :galleries,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :seo,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :cost, :description, :material, :title, :category_id,
                  :galleries_attributes, :seo_attributes

  validates :cost, :numericality => { :greater_than => 0 },
                   :length => { :maximum => 10 }
  validates :title, :presence => true,
                    :length => { :minimum => 2, :maximum => 50 },
                    :uniqueness => true
  validates :description, :length => { :maximum => 50 }
  validates :material, :length => { :maximum => 50 }
  validates :category_id, :presence => true
  validates_associated :galleries

  scope :for_category, ->(category) { where('category_id = ?', category) }
end
