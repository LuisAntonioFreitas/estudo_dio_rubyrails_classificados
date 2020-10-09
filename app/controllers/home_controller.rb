class HomeController < ApplicationController
  def show
    @ads = Ad.all

    @x = "XXXX #{session[:user_id]} XXXX"
  end
end