class BooksController < ApplicationController
  before_action :redirect_to_admin_books, only: [:index]
  before_action :logged_in_user, only: %i[show]
  helper_method :show_status

  def index
    @books = Book.eager_load(:reservation_active, :lend_active)
  end

  def show
    @book = Book.find(params[:id])
    lending = @book.lendings.where(return_status: false, user_id: current_user.id).first
    redirect_to lending if lending
    reservation = @book.reservations.where("reservation_at >= ?", Time.now).where(user_id: current_user.id).first
    redirect_to reservation_path(reservation) if reservation
    @reservations = @book.reservations.where("reservation_at >= ?", Time.now).order(reservation_at: :asc)
  end

  def show_status(book)
    current_user_id = current_user&.id
    lending_status = book.lend_active.any?{ |lending| lending.user_id == current_user_id }
    lent_status = book.lend_active
    reservation_status = book.reservation_active.any?{ |reservation| reservation.user_id == current_user_id }

    if lending_status && current_user_id.present?
      "lending"
    elsif reservation_status && current_user_id.present?
      "reserved"
    elsif lent_status.present?
      "lent"
    else
      "available"
    end
  end

  private

  def redirect_to_admin_books
    return unless current_user&.admin?

    redirect_to admin_books_path
  end

  def logged_in_user
    return unless current_user.nil?

    flash[:failed] = "Please log in."
    session[:request] = nil
    session[:request] = request.original_url
    redirect_to new_user_session_path, status: :see_other
  end
end
