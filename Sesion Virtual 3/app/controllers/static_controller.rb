class StaticController < ApplicationController
  
  def faq
  	respond_to do |format|
  		format.html {render :faq}
  	end
  end

  def about
  	respond_to do |format|
  		format.html {render :about}
  	end
  end

  def services
  	@first_name = params[:firstName]
  	@last_name = params[:lastName]  
  	@greet = "Hello " + @first_name

  	respond_to do |format|
  		format.html { render :services}
  	end
  end
end
