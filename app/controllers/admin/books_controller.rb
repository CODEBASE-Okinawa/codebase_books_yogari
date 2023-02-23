class Admin::BooksController < ApplicationController
  before_action :check_admin

  def index
    @books = Book.eager_load(:lendings).order(:id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.image.attach(params[:book][:image])
    if @book.save
      flash[:success] = "本を登録しました"
      redirect_to admin_books_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :image)
  end
end
