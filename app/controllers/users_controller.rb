class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if (params[:user][:password] == params[:user][:password_confirmation])
      @user = User.new(user_params)
      @user.save
      redirect_to "/sessions/new", notice: "Cadastro realizado com sucesso!"
    else
      redirect_to "/users/new", notice: "Senha de confirmação não confere!"
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