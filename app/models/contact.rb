class Contact < ActiveRecord::Base
  attr_accessible :content

  validates :content, :presence => true,
                      :uniqueness => true
end
