class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:health]
  
  def index
    if current_user
      redirect_to charts_url
    end
  end

  def health
  end
end
