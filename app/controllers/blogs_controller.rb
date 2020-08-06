class BlogsController < ApplicationController
  before_action :load_blog, except: %i(index new create)
  before_action :logged_in_user, except: %i(show)
  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = current_user.blogs.build
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = current_user.blogs.build blog_params

    if @blog.save
      flash[:success] = t ".success_create"
      redirect_to root_url
    else
      flash[:danger] = t ".failed_create"
      redirect_to new_blog_path
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    if @blog.update blog_params
      flash[:success] = t ".success_update"
      redirect_to @blog
    else
      flash[:danger] = t ".failed_update"
      redirect_to edit_blog_path
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    if @blog.destroy
      flash[:success] = t ".success_destroy"
      redirect_to blogs_path
    else
      flash[:danger] = t ".failed_destroy"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def load_blog
      @blog = Blog.find_by id: params[:id]
      render file: "public/404.html", layout: false unless @blog
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :body, :cover_photo)
    end
end
