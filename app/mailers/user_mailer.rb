class UserMailer < ApplicationMailer
  # 予約のリマインドを送るメール
  def reservation_remainder
    @reservation = params
    # TODO N+1問題を解消する
    @user = @reservation.user
    @book = @reservation.book

    mail(to: @user.email, subject: 'リマインダー')
  end
end
