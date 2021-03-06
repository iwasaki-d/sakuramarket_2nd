class Admin::CommoditiesController < ApplicationController
  before_action :set_commodity, only: [:show, :edit, :update, :destroy]

  def index
    @commodities = Commodity.all
  end

  # GET /commodities/1
  # GET /commodities/1.json
  def show
  end

  # GET /commodities/new
  def new
    @commodity = Commodity.new
  end

  # GET /commodities/1/edit
  def edit
  end

  # POST /commodities
  # POST /commodities.json
  def create
    @commodity = Commodity.new(commodity_params)

    respond_to do |format|
      if @commodity.save
        format.html { redirect_to [:admin, @commodity], notice: 'Commodity was successfully created.' }
        format.json { render :show, status: :created, location: @commodity }
      else
        format.html { render :new }
        format.json { render json: @commodity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /commodities/1
  # PATCH/PUT /commodities/1.json
  def update
    respond_to do |format|
      if @commodity.update(commodity_params)
        format.html { redirect_to [:admin, @commodity], notice: 'Commodity was successfully updated.' }
        format.json { render :show, status: :ok, location: @commodity }
      else
        format.html { render :edit }
        format.json { render json: @commodity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /commodities/1
  # DELETE /commodities/1.json
  def destroy
    @commodity.destroy
    format.html { redirect_to admin_commodities_url, notice: 'Commodity was successfully destroyed.' }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_commodity
    @commodity = Commodity.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def commodity_params
    params.require(:commodity).permit(:name, :price, :description, :position, :view_enabled)
  end
end
