module ApplicationHelper
  def get_book_image(isbn)
    result = GoogleBooksApi.search_by_isbn(isbn)
    result["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
  end
end
