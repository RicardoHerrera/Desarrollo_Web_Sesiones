class HomeController < ApplicationController
  def index
  end

  # para que se llame esta función, en el router se debe especificar 
  # home#formulario_post
  def formulario_post 

    @first_name = params[:firstName]    
    @last_name = params[:lastName] 
    @dni = params[:dni] # Debe tener un campo con name="dni" en el formulario

    if (@dni.length != 8) 
    	# Mostrar mensaje error
    	# no hacer nada
    end

    render "static/services" , locals: { firstName: @first_name, lastName: @last_name}

  end 

end
