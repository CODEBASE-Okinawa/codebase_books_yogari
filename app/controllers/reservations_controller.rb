class ReservationsController < ApplicationController
  def index
    @reserved_books = Reservation.where(user_id: current_user.id).where("reservation_at > ?",
                                                                        Time.now).order(reservation_at: :asc)
  end

  def show
  end

  def create
    @reservation = Book.find(params[:book_id]).reservations.build(reservation_param(params))
    return unless @reservation.save

    flash[:success] = "予約が完了しました"
    redirect_to reservations_path
  end

  def reservation_param(data)
    @reservation_info = { book_id: data[:book_id],
                          user_id: current_user.id,
                          reservation_at: data[:start_at],
                          return_at: data[:return_at] }
  end
end
