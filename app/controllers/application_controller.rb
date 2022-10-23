class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number])
  end

  # ログイン後の遷移先
  def after_sign_in_path_for(resource)
    if customer_signed_in?
      customer_path(resource)
    else
      admin_path
    end
  end

  # ログアウト後の遷移先
  def after_sign_out_path_for(resource)
    root_path
  end

end