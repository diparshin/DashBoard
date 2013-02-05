class ItemPresenter < Keynote::Presenter
  presents :item
  
  def link_to_tags
    a = item.tags.pluck(:name).map { |name| link_to(name, show_tagged_items_url(name)) }
    a.join(', ').html_safe
  end
end
