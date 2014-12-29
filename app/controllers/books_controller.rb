class BooksController < ApplicationController

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

  def index
    @users = User.all
    @books = Book.order('created_at')
  end

  def show
    @book = Book.find(params[:id])
    @reviews = Review.order('created_at').where(book_id: @book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: "Your book was removed."
  end

  def new
    @books = Book.new
  end

  def create
    @books = Book.new(book_params)
    @books.user_id = current_user.id
    if @books.save
      redirect_to books_path(@books), notice: "Book Submitted"
    else
      flash.now[:notice]= @books.errors.full_messages
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    redirect_to @book
  end

  def book_params
    params.require(:book).permit(:title, :url, :description, :user_id)
  end

end
