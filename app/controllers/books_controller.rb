class BooksController < ApplicationController
  before_action :redirect_to_admin_books, only: [:index]
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  private

  def redirect_to_admin_books
    if current_user.admin?
      redirect_to admin_books_path
    end
  end
end
