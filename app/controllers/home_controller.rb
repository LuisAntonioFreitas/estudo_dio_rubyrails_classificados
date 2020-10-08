class HomeController < ApplicationController
  def show
    @x = "XXXX #{session[:user_id]} XXXX"
  end
end