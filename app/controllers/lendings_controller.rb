class LendingsController < ApplicationController
  before_action :require_signed_in, only: [:index, :show]
  before_action :redirect_lendings, only: :show

  def index
    @lendings = current_user.lendings.not_yet_returned
  end

  def show
    @lending = Lending.find(params[:id])
  end

  private
  
  #lendingへのアクセスは、サインインが必要
  def require_signed_in
    redirect_to new_user_session_path if !user_signed_in?
  end

  # サインインしているユーザーが借りていない本だったら、貸出一覧ページへリダイレクト
  def redirect_lendings
    if current_user.lendings.find_by(id: params[:id]).blank?
      redirect_to lendings_path
    end
  end
end
