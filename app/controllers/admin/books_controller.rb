class Admin::BooksController < ApplicationController
  before_action :check_admin

  def index
    @books = Book.all
  end

  private

  def check_admin
    unless current_user.admin?
      redirect_to books_path
    end
  end
end
