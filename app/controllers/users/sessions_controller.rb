# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

  # ログイン後、本一覧へリダイレクト
  def after_sign_in_path_for(resource)
    session[:request] ? redirect_to_previous_page : books_path
  end

  #記憶したurlがある場合、そのページへリダイレクト
  def redirect_to_previous_page
    previous_page = session[:request]
    session[:request] = nil
    previous_page
  end
end
