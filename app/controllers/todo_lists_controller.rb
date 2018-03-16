class TodoListsController < ApplicationController
  before_action :set_todo_list, only: [:show, :edit, :update, :destroy]

  def index
    @todo_lists = TodoList.all
  end

  def new
    @todo_list = TodoList.new
  end

  def create
    @todo_list = TodoList.create(todo_list_params)

    if @todo_list.save
      flash[:success] = "The Todo List has been created succeefully."
    else
      flash[:warning] = "The Todo List cannot be created. Check the inputs."
    end
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    @todo_list.update(todo_list_params)

    if @todo_list.save
      flash[:success] = "The Todo List has been updated succeefully."
    else
      flash[:warning] = "The Todo List cannot be updated. Check the inputs."
      render :new
    end
    redirect_to root_path
  end

  def destroy
    @todo_list.destroy
    redirect_to root_path
  end

  private

  def todo_list_params
    params.require(:todo_list).permit(:title, :description)
  end

  def set_todo_list
    @todo_list = TodoList.find(params[:id])
  end
end
