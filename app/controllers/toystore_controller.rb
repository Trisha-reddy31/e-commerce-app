class toystoresController < ApplicationController
  before_action :set_toystore, only: %i[ show edit update destroy ]

  # GET /toystores or /toystores.json
  def index
    @toystores = toystore.all
  end

  # GET /toystores/1 or /toystores/1.json
  def show
  end

  # GET /toystores/new
  def new
    @toystore = toystore.new
  end

  # GET /toystores/1/edit
  def edit
  end

  # POST /toystores or /toystores.json
  def create
    @toystore = toystore.new(toystore_params)

    respond_to do |format|
      if @toystore.save
        format.html { redirect_to @toystore, notice: "toystore was successfully created." }
        format.json { render :show, status: :created, location: @toystore }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @toystore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /toystores/1 or /toystores/1.json
  def update
    respond_to do |format|
      if @toystore.update(toystore_params)
        format.html { redirect_to @toystore, notice: "toystore was successfully updated." }
        format.json { render :show, status: :ok, location: @toystore }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @toystore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toystores/1 or /toystores/1.json
  def destroy
    @toystore.destroy!

    respond_to do |format|
      format.html { redirect_to toystores_path, status: :see_other, notice: "toystore was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   
    # Only allow a list of trusted parameters through.
    def toystore_params
      params.require(:toystore).permit(:name, :brand, :price, :toytype, :description, :main_image)
    end
end
# In your controller
def set_toystore
  @toystore = toystore.find_by(id: params[:id])
  unless @toystore
    redirect_to toystores_path, alert: "toystore not found."
  end
end
