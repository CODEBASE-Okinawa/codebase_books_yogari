class RequestBooksController < ApplicationController
    def search
        word = URI.encode_www_form_component(params[:word])
        @result = GoogleBooksApi.search_by_word(word)
        if @result["totalItems"] == 0
            flash[:danger] = "本が見つかりませんでした"
            redirect_to searches_path
        else
            @result
            @items = RequestBook.new
            render template: "searches/index"
        end
    end

    def create
        @items = RequestBook.new(book_params)
    end

    def update
    end

    private

    def book_params
        params.permit(:title, :author)
    end

end
