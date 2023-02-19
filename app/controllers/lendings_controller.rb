class LendingsController < ApplicationController
  before_action :require_signed_in, only: [:index, :show]
  
  def index
    @lendings = current_user.lendings.not_yet_returned
  end

  def show
  end

  def create
    @lending = Book.find(params[:book_id]).lendings.build(lending_params(params))
    return unless @lending.save

    flash[:success] = "貸出が完了しました"
    redirect_to lendings_path
  end

  private

  # lendingページへのアクセスは、サインインが必要
  def require_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def lending_params(data)
    @lending_params = { book_id: data[:book_id],
                        user_id: current_user.id,
                        return_at: data[:return_at] }
  end
end
