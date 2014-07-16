class TodoItemsController < ApplicationController

  def index
    todo_items = TodoItem.where(repo_id: params[:repo_id])
    render json: todo_items.to_json
  end

  def show
    todo_item = TodoItem.find(params[:id])
    render json: todo_item.to_json
  end

  def create
    todo_item = TodoItem.create(todo_item_params)
    render json: todo_item.to_json
  end

  def update
    todo_item = TodoItem.find(params[:id])
    todo_item.update(todo_item_params)
    render json: todo_item.to_json
  end

  def destroy
    todo_item = TodoItem.find(params[:id])
    todo_item.destroy
    render json: todo_item.to_json
  end

  private

  def todo_item_params
    params.require(:todo_item).permit(:content)
  end

end
