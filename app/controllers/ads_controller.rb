class AdsController < ApplicationController
  before_action :require_logged_user

  def new
    @ad = Ad.new
  end

  def edit
    # @ad = Ad.find(params[:id]) # traz pelo id
    @ad = current_user.ads.find(params[:id]) # traz apenas do usuário o id
  end

  def create
    @ad = Ad.new(ad_params.merge(user_id: current_user.id))
    if @ad.save
      redirect_to root_path, notice: t("mensagens.mensagem_sucesso_anuncio") 
    else
      flash[:alert] = t("mensagens.mensagem_erro_anuncio")
      render :new
      # redirect_to "/ads/new", alert: t("mensagens.mensagem_erro_anuncio")
    end
  end

  def update
    # @ad = Ad.find(params[:id]) # traz pelo id
    @ad = current_user.ads.find(params[:id]) # traz apenas do usuário o id
    if @ad.update(ad_params)
      redirect_to root_path, notice: t("mensagens.mensagem_sucesso_atualizado_anuncio") 
    else
      flash[:alert] = t("mensagens.mensagem_erro_atualizado_anuncio")
      render :edit
      # redirect_to "/ads/edit", alert: t("mensagens.mensagem_erro_atualizado_anuncio")
    end
  end

  private

  def ad_params
    params.require(:ad).permit(
      :title, 
      :description, 
      :price
    )
  end
end