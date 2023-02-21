class ReservationsController < ApplicationController
  before_action :logged_in_user, only: %i[index show]
  def index
    @reservations = Reservation.where(user_id: current_user.id).where("reservation_at >= ?",
                                                                        Time.now).order(reservation_at: :asc)
  end

  def show
    @reservation = Reservation.find(params[:id])
    redirect_to book_path(@reservation.book) unless @reservation
  end

  def create
    @reservation = Book.find(params[:book_id]).reservations.build(reservation_param(params))
    return unless @reservation.save

    flash[:success] = "予約が完了しました"
    redirect_to reservations_path
  end

  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      redirect_to reservations_path
    else
      redirect_to request.referer
    end
  end

  def reservation_param(data)
    @reservation_info = { book_id: data[:book_id],
                          user_id: current_user.id,
                          reservation_at: data[:start_at],
                          return_at: data[:return_at] }
  end

  # ログイン済みユーザーかどうか確認
  def logged_in_user
    return unless current_user.nil?

    flash[:danger] = "Please log in."
    redirect_to new_user_session_path, status: :see_other
  end
end
