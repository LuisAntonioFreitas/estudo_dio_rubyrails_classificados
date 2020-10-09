module ApplicationHelper
  # def user_signed_in?
  #   # pega o usuário atual, baseado na sessão
  #   current_user.present?
  # end
  
  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  # end
  
  def clean_flash
    flash[:notice] = nil
    flash[:alert] = nil
  end
end
