class ApplicationController < ActionController::
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のページ遷移
  def after_sign_in_path_for(resource)
    case resource
    when Sale
      sale_customers_path
    when Customer
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :company_name])
  end
end
