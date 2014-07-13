class ResourceItemsController < ApplicationController

  def index
    resource_items = ResourceItem.all
    render json: resource_items.to_json
  end

  def show
    resource_item = ResourceItem.find(params[:id])
    render json: resource_item.to_json
  end

  def create
    resource_item = ResourceItem.create(resource_item_params)
    render json: resource_item.to_json
  end

  def update
    resource_item = ResourceItem.find(params[:id])
    resource_item.update(resource_item_params)
    render json: resource_item.to_json
  end

  def destroy
    resource_item = ResourceItem.find(params[:id])
    resource_item.destroy
    render json: resource_item.to_json
  end

  private

  def resource_item_params
    params.require(:resource_item).permit(:name, :url)
  end

end
