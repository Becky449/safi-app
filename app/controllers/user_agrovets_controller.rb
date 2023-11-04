class UserAgrovetsController < ApplicationController
  before_action :set_user_agrovet, only: %i[ show edit update destroy ]

  # GET /user_agrovets or /user_agrovets.json
  def index
    @user_agrovets = UserAgrovet.all
  end

  # GET /user_agrovets/1 or /user_agrovets/1.json
  def show
  end

  # GET /user_agrovets/new
  def new
    @user_agrovet = UserAgrovet.new
  end

  # GET /user_agrovets/1/edit
  def edit
  end

  # POST /user_agrovets or /user_agrovets.json
  def create
    @user_agrovet = UserAgrovet.new(user_agrovet_params)

    respond_to do |format|
      if @user_agrovet.save
        format.html { redirect_to user_agrovet_url(@user_agrovet), notice: "User agrovet was successfully created." }
        format.json { render :show, status: :created, location: @user_agrovet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_agrovet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_agrovets/1 or /user_agrovets/1.json
  def update
    respond_to do |format|
      if @user_agrovet.update(user_agrovet_params)
        format.html { redirect_to user_agrovet_url(@user_agrovet), notice: "User agrovet was successfully updated." }
        format.json { render :show, status: :ok, location: @user_agrovet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_agrovet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_agrovets/1 or /user_agrovets/1.json
  def destroy
    @user_agrovet.destroy

    respond_to do |format|
      format.html { redirect_to user_agrovets_url, notice: "User agrovet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_agrovet
      @user_agrovet = UserAgrovet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_agrovet_params
      params.require(:user_agrovet).permit(:user_id, :agrovet_id)
    end
end
