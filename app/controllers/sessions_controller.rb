class SessionsController < ApplicationController
  before_action :clean_session

  def new
    @user = User.new
  end

  def create
    # { "users" => { "email": "bla", "password": "bla" } }
    user = User.find_by(email: params[:user][:email])
    if !user
      flash[:alert] = t("mensagens.mensagem_erro_senha"); # t(".invalid_credentials") # flash.pt-BR.yml
      @user = User.new
      render :new
      # redirect_to new_session_path, alert: t("mensagens.mensagem_erro_senha")
    else
      if (user.password == params[:user][:password])

        session[:user_id] = user.id
        redirect_to root_path, notice: t("mensagens.mensagem_boasvindas", name: user.name); # t(".welcome") # flash.pt-BR.yml
  
     else
      flash[:alert] = t("mensagens.mensagem_erro_senha"); # t(".invalid_credentials") # flash.pt-BR.yml
      @user = User.new
      render :new
       # redirect_to new_session_path, alert: t("mensagens.mensagem_erro_senha")
     end
    end 
  end

  def destroy
    # flash[:notice] = t("mensagens.mensagem_sair"); # t(".session_finished") # flash.pt-BR.yml
    # @user = User.new
    # render :new
    redirect_to root_path, notice: t("mensagens.mensagem_sair"); # t(".session_finished") # flash.pt-BR.yml
  end

  private

  def clean_session
    txt_notice = flash[:notice] 
    txt_alert = flash[:alert] 

    reset_session

    flash[:notice] = txt_notice
    flash[:alert] = txt_alert
  end
end