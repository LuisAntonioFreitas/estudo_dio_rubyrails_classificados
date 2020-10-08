class SessionsController < ApplicationController
  before_action :clean_session

  def new
    @user = User.new
  end

  def create
    # { "users" => { "email": "bla", "password": "bla" } }
    user = User.find_by(email: params[:user][:email])
    if !user
      flash[:alert] = t("mensagens.mensagem_erro_senha"); 
      @user = User.new
      render :new
      # redirect_to new_session_path, alert: t("mensagens.mensagem_erro_senha")
    else
      if (user.password == params[:user][:password])

        session[:user_id] = user.id
        redirect_to root_path, notice: t("mensagens.mensagem_boasvindas", name: user.name)
  
     else
      flash[:alert] = t("mensagens.mensagem_erro_senha");
      @user = User.new
      render :new
       # redirect_to new_session_path, alert: t("mensagens.mensagem_erro_senha")
     end
    end 
  end

  def destroy
    flash[:notice] = t("mensagens.mensagem_sair");
    @user = User.new
    render :new
  end

  private

  def clean_session
    reset_session
  end
end