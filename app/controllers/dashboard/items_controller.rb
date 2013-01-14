class Dashboard::ItemsController < ApplicationController
  def index
    @items = current_user.items
  end
  
  def new
    @item = current_user.items.new
  end
  
  def create
    @item = current_user.items.build(params[:item].slice(:title, :body))
    
    if @item.save
      @item.set_tags(params[:tags])
      redirect_to dashboard_items_url
    else
      render :action => "new"
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to dashboard_items_url
  end
end
