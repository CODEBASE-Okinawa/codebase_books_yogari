class Admin::RequestsController < ApplicationController
  def index
    @requests = RequestBook.where(status: "true")
  end

  def toggle
    request = RequestBook.find(params[:id])

    request.status = !request.status
    request.save

    redirect_to admin_requests_path
  end
end
