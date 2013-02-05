module TagHelper
  def tag_cloud
    a = Array.new
    Tag.cloud_data.each do |name, weight|
      a << link_to(name, show_tagged_items_url(name), :style => "font-size: #{(100*weight).round}%")      
    end
    a.join(' ').html_safe
  end
end
