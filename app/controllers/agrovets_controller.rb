class AgrovetsController < ApplicationController
  before_action :set_agrovet, only: %i[ show edit update destroy ]

  # GET /agrovets or /agrovets.json
  def index
    @agrovets = Agrovet.all
    @agrovets_count = Agrovet.count
  end

  # GET /agrovets/1 or /agrovets/1.json
  def show
  end

  # GET /agrovets/new
  def new
    @agrovet = current_user.agrovets.build
  end

  # GET /agrovets/1/edit
  def edit
  end

  # POST /agrovets or /agrovets.json
  def create
    @agrovet = Agrovet.new(agrovet_params)
    
    respond_to do |format|
      if @agrovet.save
        format.html { redirect_to pages_salesrep_path, notice: "Agrovet was successfully created." }
        format.json { render :show, status: :created, location: @agrovet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agrovet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agrovets/1 or /agrovets/1.json
  def update
    respond_to do |format|
      if @agrovet.update(agrovet_params)
        format.html { redirect_to agrovet_url(@agrovet), notice: "Agrovet was successfully updated." }
        format.json { render :show, status: :ok, location: @agrovet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agrovet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agrovets/1 or /agrovets/1.json
  def destroy
    @agrovet.destroy

    respond_to do |format|
      format.html { redirect_to agrovets_url, notice: "Agrovet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def agrovetinfo
    @agrovet = Agrovet.find(params[:id])
    @latest_data_entry = @agrovet.data_entries.order(created_at: :desc).first
    @products = Product.limit(7)
    @latest_product_1_data_entry_total = (@products.first&.price || 0) * (@latest_data_entry&.product_1_quantity || 0)
    @latest_product_2_data_entry_total = (@products.second&.price || 0) * (@latest_data_entry&.product_2_quantity || 0)
    @latest_product_3_data_entry_total = (@products.third&.price || 0) * (@latest_data_entry&.product_3_quantity || 0)
    @latest_product_4_data_entry_total = (@products.fourth&.price || 0) * (@latest_data_entry&.product_4_quantity || 0)
    @latest_total_data_entry_amount = @latest_product_1_data_entry_total + @latest_product_2_data_entry_total + @latest_product_3_data_entry_total + @latest_product_4_data_entry_total
  end

  def placeorder
    @agrovet = Agrovet.find(params[:id])
    @products = Product.limit(7)
    @latest_order = @agrovet.orders.order(created_at: :desc).first
    @latest_product_1_order_total = (@products.first&.price || 0) * (@latest_order&.product_1_quantity || 0)
    @latest_product_2_order_total = (@products.second&.price || 0) * (@latest_order&.product_2_quantity || 0)
    @latest_product_3_order_total = (@products.third&.price || 0) * (@latest_order&.product_3_quantity || 0)
    @latest_product_4_order_total = (@products.fourth&.price || 0) * (@latest_order&.product_4_quantity || 0)
    @latest_total_order_amount = @latest_product_1_order_total + @latest_product_2_order_total + @latest_product_3_order_total + @latest_product_4_order_total
  end

  def allorders
    @agrovet = Agrovet.find(params[:id])
    @orders = @agrovet.orders
  end

  def orderdetail
    @agrovet = Agrovet.find(params[:id])
    @orders = @agrovet.orders
    # @order = Order.find(params[:id])
    @order = @orders.find(params[:order_id])
    @products = Product.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agrovet
      @agrovet = Agrovet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agrovet_params
      params.require(:agrovet).permit(:name, :location, :owner_name, :owner_phone, :owner_email, :user_id)
    end
end
