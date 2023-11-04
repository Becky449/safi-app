# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    user = User.find_by(email: params[:user][:email])
  
    if user && user.valid_password?(params[:user][:password])
      sign_in user
  
      if user.role == 'admin'
        redirect_to pages_admin_path
      elsif user.role == 'salesrep'
        redirect_to pages_salesrep_path
      elsif user.role == 'manager'
        redirect_to pages_manager_path
      else
        flash[:alert] = 'Invalid email or password'
      end
    else
      flash[:alert] = 'Invalid email or password'
    end
end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
