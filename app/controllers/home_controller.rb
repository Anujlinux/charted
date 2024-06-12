class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:health]
  
  def index
  end

  def health
  end
end
