class HomeController < ApplicationController
  
  def index
  	@cities = [["Callao", 1], ["Lima", 2]]
  end

end
