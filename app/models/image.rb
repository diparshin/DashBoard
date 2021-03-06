class Image < ActiveRecord::Base
  belongs_to :item
  attr_accessible :filename, :order
  validates :filename, :presence => true
  
  mount_uploader :filename, ImageUploader
  
  def main?
    return false if self.item.blank?
    self == self.item.image
  end
end