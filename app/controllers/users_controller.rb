class UsersController < ApplicationController
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
        redirect_to new_session_path, notice: t("mensagens.mensagem_sucesso_cadastro") # t(".success") # flash.pt-BR.yml
      else
        render :new
        # redirect_to "/users/new", alert: "Cadastro não realizado!"
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