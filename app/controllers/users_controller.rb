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
        redirect_to "/sessions/new", notice: "Cadastro realizado com sucesso!"
      else
        render :new
        # redirect_to "/users/new", alert: "Cadastro não realizado!"
      end

    else
      redirect_to "/users/new", alert: "Senha de confirmação não confere!"
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