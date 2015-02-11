class WelcomeController < ApplicationController
  def index
  	@world = params[:world]
  end
end
