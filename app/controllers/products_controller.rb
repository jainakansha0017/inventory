class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @categories=Category.find(params[:category][:id])
    respond_to do |format|
      if @product.save
        @product.categories << @categories
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :index, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def mapping
    @product = Product.find(params[:id])
    # @categories=Category.find(params[:category][:id])
  end

  def mapping_create
    @product = Product.find(params[:id])
    @categories=Category.find(params[:category][:id])
    a= Category.joins("join categories_products on categories_products.category_id=categories.id").where("categories_products.product_id = ? and  categories_products.category_id = ?", @product.id,params[:category][:id]) 
   respond_to do |format|
    if a.length>0
     format.html { redirect_to products_path, notice: 'Product was already mapped.' }
        format.json { render :index, status: :created, location: @product }
    else
      @product.categories << @categories
      format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render :index, status: :created, location: @product }
    end
  end
  end
  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { render :index, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:drug_name,:quantity,:price)
    end
end
