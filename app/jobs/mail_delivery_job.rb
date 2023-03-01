class MailDeliveryJob < ApplicationJob
  queue_as :default

  def perform(reservation_data)
    puts "---------------------------------------------------"
    puts reservation_data.book.title
    # セットされた日付に、貸出予定のリマインド通知を送る
    UserMailer.with(reservation_data).reservation_remainder.deliver
    puts "---------------------------------------------------"
  end
end
