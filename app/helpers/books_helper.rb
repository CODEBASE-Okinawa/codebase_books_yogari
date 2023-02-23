module BooksHelper
  def show_status(book_id, reservations, lendings)
    if lendings.find_by(book_id: book_id, return_status: false, user_id: current_user.id)
      html =  '<span class="text-sm text-black" style = background:#0096FF;font-weight: bold;">現在借りています</span>'
      render html: html.html_safe
    elsif lendings.find_by(book_id: book_id, return_status: false)
      html =  '<span class="text-sm text-black"style = background:#FF2c2c;">貸出中</span>'
      render html: html.html_safe
    elsif reservations.where(book_id: book_id, user_id: current_user.id).where("reservation_at >= ?",
      Date.today).exists?
      html =  '<span class="text-sm text-black" style = background:#FFEE75;font-weight: bold;">予約しています</span>'
      render html: html.html_safe
    else
      html =  '<span class="text-sm text-black" style = background:#98FF98;font-weight: bold;">貸出可能</span>'
      render html: html.html_safe
    end
  end
end
