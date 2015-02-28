class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  # GET /bids
  # GET /bids.json
  def index
    @bids = Bid.all
  end

  # GET /bids/1
  # GET /bids/1.json
  def show
  end

  # GET /bids/new
  def new
    @bid = Bid.new
  end

  # GET /bids/1/edit
  def edit
  end
o
  def accept
    @bid = Bid.find(params[:id])
    @bid.status = "accepted"
    @post = @bid.post
    raise
  end

  def decline
  end

  # POST /bids
  # POST /bids.json
  def create
    @bid = Bid.new(bid_params)

    respond_to do |format|
      if @bid.save

        @users = []
        @post = @bid.post
        @user_activity = PublicActivity::Activity.create(owner: current_user,
               key: 'Post.placed_a_bid_on_your_post',recipient: @post.user, trackable:@bid)
        if @user_activity.id != nil 
          @users << @post.user.id
          sync_new @user_activity, scope: @post.user
          sync_new @user_activity
        end
        @post.comments.each do |comment|
          if !(@users.include? comment.user.id) 
            @activity =PublicActivity::Activity.create(owner: current_user,
               key: 'Post.placed_a_bid_on_a_post',recipient: comment.user, trackable:@comment)
            if @user_activity.id != nil 
              @users << comment.user.id
              sync_new @activity, scope: comment.user
              sync_new @activity
            end
          end
        end
        @post.bids.each do |bid|
          if !(@users.include? bid.user.id) 
            @activity =PublicActivity::Activity.create(owner: current_user,
               key: 'Post.placed_a_bid_on_a_post',recipient: bid.user, trackable:@bid)
            if @user_activity.id != nil 
              @users << bid.user.id
              sync_new @activity, scope: bid.user
              sync_new @activity
            end
          end
        end
        format.html { redirect_to @post, notice: 'Bid was successfully created.' }
        format.json { render :show, status: :created, location: @bid }
      else
        format.html { render :new }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bids/1
  # PATCH/PUT /bids/1.json
  def update
    respond_to do |format|
      if @bid.update(bid_params)
        format.html { redirect_to @bid, notice: 'Bid was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid }
      else
        format.html { render :edit }
        format.json { render json: @bid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bids/1
  # DELETE /bids/1.json
  def destroy
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to bids_url, notice: 'Bid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid
      @bid = Bid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:value, :status, :info, :post_id, :user_id)
    end
end
