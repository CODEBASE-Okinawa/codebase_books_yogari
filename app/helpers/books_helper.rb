module BooksHelper
  def show_status(book_id, reservations, lendings)
    if lendings.find_by(book_id: book_id, return_status: false, user_id: current_user.id)
      "現在借りています"
    elsif lendings.find_by(book_id: book_id, return_status: false)
      "貸出中"
    elsif reservations.where(book_id: book_id, user_id: current_user.id).where("reservation_at >= ?",
      Date.today).exists?
      "予約しています"
    else
      "貸出可能"
    end
  end
end
