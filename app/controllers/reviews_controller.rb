class ReviewsController < ApplicationController

before_action :authenticate_user!

  helpers do
    def current_user
      user_id = session[:user_id]
      @current_user ||= User.find(user_id) if user_id.present?
    end

    def signed_in?
      current_user.present?
    end
  end

  def set_current_user(user)
    session[:user_id] = user.id
  end

  def create
    @users = User.all
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.id

    if @review.save
    redirect_to book_path(id: @book.id), notice: "Your Review was submitted."
    else
    redirect_to :back, notice: "Your Review must be longer than 50 chars."
    end
  end

  def new
    @users = User.all
    @book = Book.find(params[:book_id])
    @reviews = Review.new
  end

  def destroy
    @review = Review.find(params[:id])
    @book = Book.find(params[:book_id])
    @review.destroy
    redirect_to book_path(id: @book.id), notice: "Your Review was terminated."
  end

  def edit
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
  end

  def update
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    @review.update_attributes(review_params)
    redirect_to book_path(id: @book.id), notice: "Your Review was editted"
  end

  private

  # def find_params
  #   @review = Review.find(params[:id])
  # end

  def review_params
    params.require(:review).permit(:description, :book_id, :user_id)
  end

end


