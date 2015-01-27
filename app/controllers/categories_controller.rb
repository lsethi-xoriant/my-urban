class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update,:destroy]
  
  respond_to :html

  def index
    if current_user == nil  
      redirect_to root_path
    else
      @categories = Category.all
      respond_with(@categories)
    end
  end

  def show
    if current_user == nil  
      redirect_to root_path
    else
      respond_with(@category)
    end
  end

  def new
    if current_user == nil  
      redirect_to root_path
    else
    @category = Category.new
    respond_with(@category)
    end
  end

  def edit
    if current_user == nil  
      redirect_to root_path
    else
      @category = Category.find(params[:id])    
    end
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
end
