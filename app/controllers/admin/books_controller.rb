class Admin::BooksController < ApplicationController
  before_action :check_admin

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.image.attach(params[:book][:image])
    if @book.save
      flash[:sucess] = "本を登録しました"
      redirect_to admin_books_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def check_admin
    unless current_user&.admin?
      redirect_to books_path
    end
  end

  def book_params
    params.require(:book).permit(:title, :image)
  end
end
