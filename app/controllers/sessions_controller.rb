class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # { "users" => { "email": "bla", "password": "bla" } }
    user = User.find_by(email: params[:user][:email])
    if (user.password == params[:user][:password])

      reset_session
      session[:user_id] = user.id
      redirect_to root_path, notice: t("mensagens.mensagem_boasvindas", name: user.name)

   else
     redirect_to new_session_path, alert: t("mensagens.mensagem_erro_senha")
   end

  end
end