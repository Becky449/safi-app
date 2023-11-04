class ApplicationController < ActionController::Base
    around_action :set_time_zone

    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?
    
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, alert: "You are not authorized to access this resource."
    end
    

    protected
    def update_allowed_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password)}
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :current_password)}
    end

    def after_sign_in_path_for(resource)
        # if current_user.admin?
        if resource.admin?
            pages_admin_path
        else
            pages_salesrep_path
        end
    end

    def set_time_zone
        Time.use_zone('Nairobi') { yield }
    end
end
