class Tag < ActiveRecord::Base
  has_and_belongs_to_many :items
  attr_accessible :name
end