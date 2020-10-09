class UsersController < ApplicationController
  before_action :require_not_logged_user

  def new
    @user = User.new
  end

  # salvar
  def create
    # verifica campo preenchido e confirmação de senha
    if (params[:user][:password].present? && params[:user][:password_confirmation].present?) && 
       (params[:user][:password] == params[:user][:password_confirmation])

      @user = User.new(user_params)
      if @user.save
        NotificationMailer.welcome(@user.name, @user.email).deliver_later
        redirect_to new_session_path, notice: t("mensagens.mensagem_sucesso_cadastro") # t(".success") # flash.pt-BR.yml
      else
        flash[:alert] = t("mensagens.mensagem_erro_cadastro")
        render :new
        # redirect_to "/users/new", alert: t("mensagens.mensagem_erro_cadastro")
      end

    else
      redirect_to new_user_path, alert: t("mensagens.mensagem_erro_confirmacao_senha")
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name, 
      :email, 
      :password
    )
  end
end