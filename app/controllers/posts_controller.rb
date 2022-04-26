# frozen_string_literal: true

class Repository
  def save_post(post)
    post.save
  end
end

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    respond_to do |format|
      CreatePost.new(respository).run(post_params).and_then do |post|
        format.html { redirect_to post_url(post), notice: "Post was successfully created." }
        format.json do
          @post = post
          render :show, status: :created, location: post
        end
      end.or_else do |errors|
        format.html do
          @post = Post.new
          errors.messages.each do |attribute, error|
            @post.errors.add(attribute, error)
          end

          render :new, status: :unprocessable_entity
        end
        format.json { render json: errors, status: :unprocessable_entity }
      end
    end
  end

  # Not Rails specific
  class CreatePost < Upgrow::Action
    result :post

    attr_reader :respository

    def initialize(respository)
      super()

      @respository = respository
    end

    def run(post_attrs)
      post = Post.new(post_attrs)
      if respository.save_post(post)
        result.success(post:)
      else
        result.failure(post.errors)
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :content)
  end

  def respository
    @respository ||= Repository.new
  end
end
