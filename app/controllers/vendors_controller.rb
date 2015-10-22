class VendorsController < ApplicationController
  load_and_authorize_resource param_method: :vendor_params
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET /vendors
  # GET /vendors.json

  
  def index
    @categories = Category.all
    if params[:category_id] == nil
      @category = nil
      @subcategories = Subcategory.all
      @vendors = Vendor.all
    else
      @category = Category.find(params[:category_id])
      @vendors = Vendor.joins(:vendor_subscriptions).where(:vendor_subscriptions =>{:category_id => @category.id}).all
      @subcategories = @category.subcategories
    end

    if params[:subcategory_id] == nil
      @subcategory = nil
    else
      @subcategory = Subcategory.find(params[:subcategory_id])
      @vendors = Vendor.joins(:vendor_subscriptions).where(:vendor_subscriptions =>{:subcategory_id => @subcategory.id}).all
    end
  end

  # GET /vendors/1
  # GET /vendors/1.json

  def show
    
    @current_raiting = Review.where.not(:raiting => nil)
    @current_raiting = @current_raiting.where(:user_id => current_user.id, :vendor_id => @vendor.id).first
    @reviews = Review.where(:user_id => current_user.id, :vendor_id => @vendor.id, :raiting => nil)
    if generate_activity(@vendor.user)
      @activity = PublicActivity::Activity.create(owner: current_user,
       key: 'Vendor.has_viewed', recipient: @vendor.user, trackable: @vendor)
      # if @activity.id != nil
      #   sync_new @activity, scope: @vendor.user
      #   sync_new @activity
      # end
      # raise
    end
  end

  # GET /vendors/newi
  def new
    @vendor = Vendor.new
    @vendor.physical_locations.build
    @vendor.vendor_subscriptions.build
    @vendor.build_delivery_location
    @vendor.external_links.build
    @vendor.assets.build
    @vendor.personal_infos.build
end

  # GET /vendors/1/edit
  def edit
    
  end

  # POST /vendors
  # POST /vendors.json
  def create
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
        if params[:profile_pic]
          if !(params[:profile_pic].empty?)
            @gallery =  @vendor.galleries.where(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
            if@gallery.empty?
              @vendor.galleries.create(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor", user_id: current_user.id)
              @gallery =  @vendor.galleries.where(name: "Profile_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
            end
            @gallery = @gallery.first
            @gallery.assets.create(image: params[:profile_pic].first)
          end

        end
        if params[:cover_pic]
          if !(params[:cover_pic].empty?)
            @gallery =  @vendor.galleries.where(name: "Cover_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
            if@gallery.empty?
              @vendor.galleries.create(name: "Cover_Pictures", owner_id: @vendor.id, owner_type: "Vendor", user_id: current_user.id)
              @gallery =  @vendor.galleries.where(name: "Cover_Pictures", owner_id: @vendor.id, owner_type: "Vendor")
            end
            @gallery = @gallery.first
            @gallery.assets.create(image: params[:cover_pic].first)
          end
        end
        if params[:media_pics]
          if !(params[:media_pics].empty?)
            @gallery =  @vendor.galleries.where(name: "Media", owner_id: @vendor.id, owner_type: "Vendor")
            if@gallery.empty?
              @vendor.galleries.create(name: "Media", owner_id: @vendor.id, owner_type: "Vendor", user_id: current_user.id)
              @gallery =  @vendor.galleries.where(name: "Media", owner_id: @vendor.id, owner_type: "Vendor")
            end
            @gallery = @gallery.first
            params[:media_pics].each { |image|
              @gallery.assets.create(image: image)
            }
            
          end
        end
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
        payment_method_ids: [],
        # Physical Location Attributes
        physical_locations_attributes: [:_destroy, :id, :address, :postal_code, :business_phone,
          :other_phone, :fax, :business_email, :business_website, :sale_location, :city_id],
        # Vendor Subscription Attributes
        vendor_subscriptions_attributes: [:_destroy, :id, :subcategory_id],
        # Delivery Location Attributes
        delivery_location_attributes: [:_destroy, :id, :location_option_id],
        # External Link Attributes
        external_links_attributes: [:_destroy, :id, :link, :external_source_id],
        # Asset Attributes (Pictures needs to nest inside assets in order to work)
        assets_attributes: [:_destroy, :id, :image],
        personal_infos_attributes: [:_destroy, :id, :legal_first_name,
          :legal_last_name, :preferred_name, :email, :title, :primary_phone, :secondary_phone],
        accepted_payment_methods_attributes: [:_destroy, :id, :payment_method_id, :preferred, :accepted]
        )
    end
end
