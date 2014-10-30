class VendorsController < ApplicationController
  load_and_authorize_resource param_method: :vendor_params
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.all
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
  end

  # GET /vendors/new
  def new
    @vendor = Vendor.new
    @vendor.physical_locations.build
    @vendor.vendor_subscriptions.build
    @vendor.delivery_locations.build
    @vendor.external_links.build
    @vendor.assets.build
  end

  # GET /vendors/1/edit
  def edit
  end

  # POST /vendors
  # POST /vendors.json
  def create
    raise
    @vendor = Vendor.new(vendor_params)
    @vendor.user = current_user
    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendors/1
  # PATCH/PUT /vendors/1.json
  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'Vendor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit(
        # Vendor Attributes
        :business_name, :business_description, :establish_date, :tax_number, :shipping,
        # Physical Location Attributes
        physical_locations_attributes: [:_destroy, :id, :address, :postal_code, :business_phone, :other_phone,
          :fax, :business_email, :business_website, :sale_location, :city_id],
        # Vendor Subscription Attributes
        vendor_subscriptions_attributes: [:_destroy, :id, :subcategory_id],
        # Delivery Location Attributes
        delivery_locations_attributes: [:_destroy, :id, :city_id],
        # External Link Attributes
        external_links_attributes: [:_destroy, :id, :link, :external_source_id],
        # Asset Attributes (Pictures needs to nest inside assets in order to work)
        assets_attributes: [:_destroy, :id, :image]
        )
    end
end
