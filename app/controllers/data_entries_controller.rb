class DataEntriesController < ApplicationController
  before_action :set_data_entry, only: %i[ show edit update destroy ]

  # GET /data_entries or /data_entries.json
  def index
    @data_entries = DataEntry.all
  end

  # GET /data_entries/1 or /data_entries/1.json
  def show
  end

  # GET /data_entries/new
  def new
    @data_entry = DataEntry.new
    @agrovet = Agrovet.find(params[:agrovet_id])
    @data_entry = @agrovet.data_entries.build
    @products = Product.all
  end

  # GET /data_entries/1/edit
  def edit
  end

  # POST /data_entries or /data_entries.json
  def create
    @data_entry = DataEntry.new(data_entry_params)
    @agrovet = Agrovet.find(params[:data_entry][:agrovet_id]) # Retrieve the associated agrovet
    @data_entry = @agrovet.data_entries.build(data_entry_params)

    respond_to do |format|
      if @data_entry.save
        format.html { redirect_to agrovetinfo_agrovet_path(@agrovet), notice: "Data entry was successfully created." }
        format.json { render :show, status: :created, location: @data_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_entries/1 or /data_entries/1.json
  def update
    respond_to do |format|
      if @data_entry.update(data_entry_params)
        format.html { redirect_to data_entry_url(@data_entry), notice: "Data entry was successfully updated." }
        format.json { render :show, status: :ok, location: @data_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @data_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_entries/1 or /data_entries/1.json
  def destroy
    @data_entry.destroy

    respond_to do |format|
      format.html { redirect_to data_entries_url, notice: "Data entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_entry
      @data_entry = DataEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def data_entry_params
      params.require(:data_entry).permit(:agrovet_id, :product_1_quantity, :product_2_quantity, :product_3_quantity, :product_4_quantity, :money_paid, :money_owed)
    end
end
