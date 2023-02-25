module BooksHelper
  # def show_status(book)
  #   current_user_id = current_user&.id
  #   lending_status = book.lend_active.any?{ |lending| lending.user_id == current_user_id }
  #   lent_status = book.lend_active
  #   reservation_status = book.reservation_active.any?{ |reservation| reservation.user_id == current_user_id }
  #
  #   if lending_status && current_user_id.present?
  #     "lending"
  #   elsif reservation_status && current_user_id.present?
  #     "reserved"
  #   elsif lent_status.present?
  #     "lent"
  #   else
  #     "available"
  #   end
  # end
end
