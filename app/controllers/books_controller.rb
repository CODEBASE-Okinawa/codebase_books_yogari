class BooksController < ApplicationController
  before_action :redirect_to_admin_books, only: [:index]
  def index
    @books = Book.all
    @reservations = Reservation.all
    @lendings = Lending.all
  end

  def show
    @book = Book.find(params[:id])
    @reservations = @book.reservations.where("reservation_at >= ?", Time.now).order(reservation_at: :asc)
    # 取得した予約にUserが含まれる場合は予約詳細にリダイレクト
    return unless @reservations.exists?(user_id: current_user.id)

    # userのreservation idを取得し、そこにリダイレクト
    redirect_to reservation_path(@reservations.find_by(user_id: current_user.id))
  end

  private

  def redirect_to_admin_books
    return unless current_user&.admin?

    redirect_to admin_books_path
  end
end
