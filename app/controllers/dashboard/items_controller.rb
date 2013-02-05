class Dashboard::ItemsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @items = current_user.items
  end
  
  def new
    @item = current_user.items.new
  end
  
  def create
    @item = current_user.items.build(params[:item])
    
    if @item.save
      @item.set_tags(params[:tags])
      redirect_to dashboard_items_url
    else
      render :new
    end
  end
  
  def edit
    @item = current_user.items.find(params[:id])
    @main = 'new'
  end
  
  def update
    @item = current_user.items.find(params[:id]);
    
    if @item.update_attributes(params[:item])
      @item.set_tags(params[:tags])
      @main = params[:main]
      render :edit

      redirect_to dashboard_items_url
    else
      render :edit  
    end
  end
  
  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to dashboard_items_url
  end
end
