class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  before_action :categories, :brands, :line_items

  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_order 

  def current_order 
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else 
      Order.new 
    end 
  end 

  def categories 
  	@categories = Category.order(:name)
  end 

  def brands
    @brands = Product.pluck(:brand).sort.uniq  
  end

  def line_items
    @line_items = current_order.line_items
  end 



  private 

  def redirect_unless_admin
    redirect_to root_path unless current_user.try(:admin?) # current_user && current_user.admin?
  end

  def configure_permitted_parameters
   	devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:role])
  end
end
