class Category < ActiveRecord::Base
  has_many :items, :dependent => :destroy

  attr_accessible :title

  validates :title, :presence => true,
                    :length => { :minimum => 2, :maximum => 50 },
                    :uniqueness => true
end
