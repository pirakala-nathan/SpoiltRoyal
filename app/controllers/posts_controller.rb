class PostsController < ApplicationController
  load_and_authorize_resource param_method: :post_params
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    
      @categories = Category.all
    if params[:category_id] == nil
      @category = nil
      @subcategories = Subcategory.all
      @posts = Post.all
    else
      @category = Category.find(params[:category_id])
      @posts = Post.joins(:post_subscriptions).where(:post_subscriptions =>{:category_id => @category.id}).all
      @subcategories = @category.subcategories
    end

    if params[:subcategory_id] == nil
      @subcategory = nil
    else
      @subcategory = Subcategory.find(params[:subcategory_id])
      @posts = Post.joins(:post_subscriptions).where(:post_subscriptions =>{:subcategory_id => @subcategory.id}).all
    end

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    raise
    @comment = Comment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.post_subscriptions.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.due_date = Date.strptime(post_params[:due_date], "%m/%d/%Y")
    @post.user = current_user
    respond_to do |format|
      if @post.save
        @users=[]
        @post.post_subscriptions.each do |sub|
          @subcategory = sub.subcategory
          @category = sub.category
          sub.save
          @subcategory.vendors.each do |vendor|
            if !(@users.include? vendor.user.id) 
              @users << vendor.user.id
              @activity = PublicActivity::Activity.create(owner: current_user,
               key: 'Post.made_a_new_post',recipient: vendor.user, trackable:@post)
              if @activity.id != nil 
                sync_new @activity, scope: vendor.user
                sync_new @activity
              end
            end
          end
        end

        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :email,:user_id,:due_date,
        post_subscriptions_attributes: [:_destroy, :id, :subcategory_id])
    end
end
