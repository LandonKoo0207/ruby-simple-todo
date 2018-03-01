class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]

  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)

    if !@todo_item.save
      flash[:warning] = "Todo Item couldn't be saved. Try again."
    end

    redirect_to @todo_list
  end

  def destroy
    @todo_item.destroy
    redirect_to @todo_list
  end

  def edit
  end

  def update
    if @todo_item.update_attributes(todo_item_params)
      flash[:success] = "Todo Item successfully updated."
    else
      render 'edit'
    end

    redirect_to @todo_list
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])
  end
end
