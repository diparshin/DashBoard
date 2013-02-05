class Tag < ActiveRecord::Base
  has_and_belongs_to_many :items
  attr_accessible :name
  
  
  #Just for fun
  def self.cloud_data
    tags_raw = ActiveRecord::Base.connection.execute("SELECT t.name, COUNT(tag_id) FROM items_tags it LEFT JOIN tags t ON it.tag_id = t.id GROUP BY tag_id")
    avg_raw = ActiveRecord::Base.connection.execute("SELECT AVG(count) FROM (SELECT COUNT(tag_id) count FROM items_tags GROUP BY tag_id) t")
    avg = avg_raw[0][0]
    
    data = Hash.new
    tags_raw.each do |raw|
      data[raw[0]] = raw[1]/avg
    end
    
    data
  end
end