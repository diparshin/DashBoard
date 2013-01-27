class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  has_many :images
  has_and_belongs_to_many :tags
  attr_accessible :body, :title
  attr_accessible :images_attributes
  validates :body, :title, :presence => true
  accepts_nested_attributes_for :images, :allow_destroy => true, :reject_if => proc { |attributes| attributes['filename'].blank? }
  
  def set_tags(tags)
    if (tags.is_a? String)
      tags = tags.split(',');
    end
    
    if ((!tags.is_a? Array) || tags.blank? || !tags.select{ |item| item.blank?}.empty? )
      raise ArgumentError, "Argument must be not empty String separated by comma or Array of such strings"
    end
    
    self.tags.clear
    
    tags.each do |tag_name|
      tag = Tag.find_or_create_by_name(tag_name.strip)
      self.tags << tag
    end
  end
  
  def main_image
    if self.image
      return self.image
    end
    
    unless self.images.empty?
      self.images.first
    else
      nil
    end
  end
end
