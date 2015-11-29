class UsersController < ApplicationController
  load_and_authorize_resource param_method: :user_params
  before_action :set_user, only: [:show, :edit, :update, :destroy, :show_account]

  #dashboard//
  def overview
    @vendor = @user.account
    @vendor.assets.build
    @posts = Post.all.limit(2)
    @messages = current_user.conversations.includes(:messages).where.not(:messages => {:user_id => current_user.id}).where(:messages => {:read => nil})
  end

  def inbox
    @convos = @user.conversations.where.not(last_msg: nil)
  end
  def watched_posts
    @watchedPosts = @user.watched_posts
  end
  def bids

    if params[:filter] == "All"
      @filter = params[:filter]
      @bids = @user.bids
    elsif params[:filter] == "won_active"
      @filter = "Won \u2022 Active"
      @bids = @user.bids.where(:status => "accepted")
      @bids = @bids.reject{|r| r.active? == false}
    elsif params[:filter] == "won_complete"
      @filter = "Won \u2022 Complete"
      @bids = @user.bids.where(:status => "accepted")
      @bids = @bids.reject{|r| r.active? == false}
    elsif params[:filter] == "lost"
      @filter = "Lost"
      @bids = @user.bids.where(:status => "Lost")
    elsif params[:filter] == "cancelled"
      @filter = "Cancelled"
      @bids = @user.bids.where(:status => "cancelled")
    else
      @filter = "All"
      @bids = @user.bids
    end
  end

  def statistics
  end

  def profile
  end

  def account
    if @user.account_type = 'Vendor'
      @vendor = @user.account
      @vendor.physical_locations.build
      @vendor.vendor_subscriptions.build
      @vendor.build_delivery_location
      @vendor.service_locations.build
      @vendor.external_links.build
      @vendor.assets.build
      @vendor.personal_infos.build
      @vendor.accepted_payment_methods.build

      end
  end

  #dashbboard-end//

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if @user.new?
      if @user.is_vendor?
        redirect_to new_vendor_path
      else
        @consumer = Consumer.new
        @consumer.save
        @consumer.user = current_user
        @consumer.save
      end
    else
      redirect_to @user.account, notice: 'User Logged in'
    end
  end

  def show_account
    if @user.is_vendor?
      redirect_to vendor_path(@user.account.id)
    else
      redirect_to consumer_path(@user.account.id)
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @username = nil
    @user.first_name = @user.first_name.delete(" ")
    @user.last_name = @user.last_name.delete(" ")
    @name = @user.first_name + "_" + @user.last_name
    @number = ""
    while @username == nil
      @check = @name + @number
      if User.where(:username => @check).empty?
        @username = @check
      else
        @number = (@number.to_i + 1).to_s
      end
    end
    @user.username = @username
    respond_to do |format|
      if @user.save
        if @user.account_type == "Vendor"
          vendor_account = Vendor.create
          @user.update(account: vendor_account)
          EmailNotificationSetting.create(settings_for: 'Vendor', timed_task: TimedTask.first, user: @user)
        else
          consumer_account = Consumer.create
          @user.update(account: consumer_account)
        end
        EmailNotificationSetting.create(settings_for: 'Post', timed_task: TimedTask.first, user: @user)
        EmailNotificationSetting.create(settings_for: 'Comment', timed_task: TimedTask.first, user: @user)
        EmailNotificationSetting.create(settings_for: 'Bid', timed_task: TimedTask.first, user: @user)
        UserMailer.new_user_welcome(@user).deliver
        format.html { redirect_to  account_user_path(@user,:new_user => true)}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to root_path(:error => "join"), notice: @user.errors.full_messages * ', ' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to :back, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :account_type, :first_name,:last_name)
    end
end
