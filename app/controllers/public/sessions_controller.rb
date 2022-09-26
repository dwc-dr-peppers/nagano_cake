# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

    def after_sign_in_path_for(resource)
        customers_my_page_path
    end

    def after_sign_out_path_for(resource)
      root_path
    end


  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_customer, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def reject_customer
    @user = Customer.find_by(email: params[:customer][:email].downcase)
    if @user
      if (@user.valid_password?(params[:customer][:password]) && (@user.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_session_path(resource_name)
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
