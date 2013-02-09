class Items < ActiveRecord::Base
  belongs_to :category
  attr_accessible :coast, :description, :material, :title
end
