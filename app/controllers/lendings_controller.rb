class LendingsController < ApplicationController
  before_action :require_signed_in, only: [:index, :show]
  def index
    @lendings = current_user.lending_books.return_false
  end

  def show
  end

  private
  #lendingページへのアクセスは、サインインが必要
  def require_signed_in
    redirect_to new_user_session_path if !user_signed_in?
  end
end
