class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).page(params[:page]).per 5
    # 5 là số bản ghi sẽ hiện trong 1 trang
  end
  
    def show
      @product = Product.find_by id: params[:id]
    end
  
    def new
      @product = Product.new
      
    end
  
    def create
      @product = Product.create product_params
    end
  
    def edit
      @product = Product.find(params[:id])
      
    end
  
    def update
      @products = Product.all
      @product = Product.find(params[:id])
      @product.update_attributes(product_params)
    end
  
    def delete
      @product = Product.find(params[:product_id])
    end
  
    def destroy
      @products = Product.all
      @product = Product.find(params[:id])
      @product.destroy
    end
  
  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
  end