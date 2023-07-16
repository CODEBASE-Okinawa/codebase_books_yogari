module GoogleBooksApi
  class << self
    def search_by_isbn(isbn)
      url = "https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}"
      response = Faraday.get(url)
      @result = JSON.parse(response.body)
    end

    # def search_by_word(word)
    #   url = JSON.parse(Net::HTTP.get(URI.parse(Addressable::URI.encode("https://www.googleapis.com/books/v1/volumes?q=title:#{word}&country=JP&maxResults=3"))))
    #   response = Faraday.get(url)
    #   @result = response.body
    # end

    def search_by_word(word)
      url = "https://www.googleapis.com/books/v1/volumes?q=title:#{word}&maxResults=3"
      response = Faraday.get(url)
      @result = JSON.parse(response.body)
    end
  end
end