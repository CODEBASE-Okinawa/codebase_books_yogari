class RequestBooksController < ApplicationController
    def search
        word = URI.encode_www_form_component(params[:word])
        @result = GoogleBooksApi.search_by_word(word)
        
        if @result["totalItems"] == 0
            flash[:danger] = "本が見つかりませんでした"
            redirect_to searches_path
        else
            @books = []
            @result["items"].each do |item|
                if item["volumeInfo"].include?("industryIdentifiers")
                    @books.push(item)
                end
            end
            @items = RequestBook.new
            @requests = RequestBook.all
            @have_books = Book.all
            render template: "searches/index"
        end
    end

    def create
        @items = RequestBook.new(book_params)
        
        if @items.save
            flash[:success] = "#{@items["title"]}をリクエストしました"
            redirect_to searches_path
        else
            render template: "searches/index"
        end
    end

    def update
    end

    private

    def book_params
        params.permit(:title, :author, :image, :isbn)
    end

end
