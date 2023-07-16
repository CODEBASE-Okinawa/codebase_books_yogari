class Admin::RequestsController < ApplicationController
  def index
    @requests = BookRequest.all

    isbn = @requests.map {|request| request.isbn.to_s}
    # binding.irb
  end
end
