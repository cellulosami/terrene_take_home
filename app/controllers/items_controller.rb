# app/controllers/items_controller.rb
class ItemsController < ApplicationController
    before_action :set_todo, only: [:index, :create]
    before_action :set_item, only: [:show, :update, :destroy]
  
    # GET /todos/:todo_id/items/page
    def index
      #defaults to page 1 if there is no page or if the page is out of range
      unless params[:page] && @todo.items.page(params[:page]).per(10).out_of_range? == false
        params[:page] = 1
      end

      response = @todo.items.page(params[:page]).per(10)
      json_response(response)
    end
  
    # GET /items/:id
    def show
      json_response(@item)
    end
  
    # POST /todos/:todo_id/items
    def create
      @todo.items.create!(item_params)
      json_response(@todo, :created)
    end
  
    # PUT /items/:id
    def update
      @item.update(item_params)
      head :no_content
    end
  
    # DELETE /items/:id
    def destroy
      @item.destroy
      head :no_content
    end
  
    private
  
    def item_params
      params.permit(:name, :done)
    end
  
    def set_todo
      @todo = Todo.find(params[:todo_id])
    end
  
    def set_item
      @item = Item.find(params[:id])
    end
  end