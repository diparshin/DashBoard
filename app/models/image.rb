class Image < ActiveRecord::Base
  belongs_to :item
  attr_accessible :filename, :order
end
