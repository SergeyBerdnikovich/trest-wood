class Item < ActiveRecord::Base
  belongs_to :category
  has_many :galleries, :dependent => :destroy

  accepts_nested_attributes_for :galleries,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  attr_accessible :cost, :description, :material, :title, :category_id, :galleries_attributes

  validates :cost, :numericality => { :greater_than => 0 },
                   :length => { :maximum => 10 }
  validates :title, :presence => true,
                    :length => { :minimum => 2, :maximum => 50 },
                    :uniqueness => true
  validates :description, :length => { :minimum => 2, :maximum => 50 }
  validates :material, :length => { :minimum => 2, :maximum => 50 }
  validates :category_id, :presence => true
  validates_associated :galleries

  scope :for_category, ->(category) { where('category_id = ?', category) }
end