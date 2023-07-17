class Admin::BooksController < ApplicationController
  before_action :check_admin
  helper_method :registered_book?

  def index
    @books = Book.eager_load(:lending).with_attached_image.order(:id)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.image.attach(params[:book][:image])
    if @book.save
      flash[:success] = "本を登録しました"
      redirect_to admin_books_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def search
    @result = GoogleBooksApi.search_by_isbn(params[:isbn])
    if @result["totalItems"] == 0
      flash[:danger] = "本が見つかりませんでした"
      redirect_to new_admin_book_path
    else
      @result
      render 'new'
    end
  end

  def search_registration
    Book.create!(
      title: params[:title],
      isbn: params[:isbn],
    )
    flash[:success] = "本を登録しました"
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :image)
  end

  def registered_book?
    Book.exists?(isbn: @result["items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"].to_i)
  end
end
