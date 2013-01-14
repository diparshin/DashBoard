class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  has_and_belongs_to_many :tags
  attr_accessible :body, :title
  validates :body, :title, :presence => true
  
  def set_tags(tags)
    if (tags.is_a? String)
      tags = tags.split(',');
    end
    
    if (!tags.is_a? Array or tags.blank? or !tags.select{ |item| item.blank?}.empty? )
      raise ArgumentError, "Argument must be not empty String separated by comma or Array of such strings"
    end
    
    self.tags.clear
    
    tags.each do |tag_name|
      tag_name.strip!
      tag = Tag.find_or_create_by_name(tag_name)
      self.tags << tag
    end
  end
end