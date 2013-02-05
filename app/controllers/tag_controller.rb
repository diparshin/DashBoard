class TagController < ApplicationController
  def show
    tag = Tag.find_by_name(params[:name])
    @items = tag.blank? ? Array.new : tag.items
  end
end
