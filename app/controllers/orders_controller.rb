class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
    @products = Product.all
    @agrovet = Agrovet.find(params[:agrovet_id])
  end

  # GET /orders/1 or /orders/1.json
  def show
    @products = Product.all
    @order = Order.find(params[:id])  # Find the order by its ID
    @agrovet = @order.agrovet 
    @product_1_order_total = (@products.first&.price || 0) * (@order&.product_1_quantity || 0)
    @product_2_order_total = (@products.second&.price || 0) * (@order&.product_2_quantity || 0)
    @product_3_order_total = (@products.third&.price || 0) * (@order&.product_3_quantity || 0)
    @product_4_order_total = (@products.fourth&.price || 0) * (@order&.product_4_quantity || 0)
    @total_order_amount = @product_1_order_total + @product_2_order_total + @product_3_order_total + @product_4_order_total
  
  end

  # GET /orders/new
  def new
    @agrovet = Agrovet.find(params[:agrovet_id])
    @order = Order.new
    @products = Product.all
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @agrovet = @order.agrovet
    @products = Product.all
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    @agrovet = Agrovet.find(params[:order][:agrovet_id]) # Retrieve the associated agrovet
    @order = @agrovet.orders.build(order_params.except(:data_entry))
    @order.order_number = @order.id
    @products = Product.all
    @products = @agrovet.products

    respond_to do |format|
      if @order.save
        format.html { redirect_to placeorder_agrovet_path(@agrovet), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    @order = Order.find(params[:id])
    @agrovet = @order.agrovet
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to placeorder_agrovet_path(@agrovet), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def orderdetail
    @agrovet = Agrovet.find(params[:id])
    @orders = @agrovet.orders
    # @order = Order.find(params[:id])
    @order = @orders.find(params[:order_id])
    @products = Product.all
  end

  def total_amount
    # Calculate the total amount for this order
    total = 0

    total += @product_1_quantity * @products.first&.price
    total += @product_2_quantity * @products.second&.price
    total += @product_3_quantity * @products.third&.price
    total += @product_4_quantity * @products.fourth&.price

    return total
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:agrovet_id, :order_number, :product_1_quantity, :product_2_quantity, :product_3_quantity, :product_4_quantity, :status)
    end

    
end
