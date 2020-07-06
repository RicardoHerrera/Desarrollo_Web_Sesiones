class UsuariosController < ApplicationController
  def index
  	@usuarios = Usuario.all
  end

  def show
  	@usuario = Usuario.find(params[:id])
  end

  def new
  	@usuario = Usuario.new
  end

  def create
  	@usuario = Usuario.create(params.require(:usuario).permit(:name, :apellido, :avatar))
  	if @usuario.save
	  		flash[:alert] = "Usuario Creado!"
        redirect_to new_usuario_url
	  	else
	  		redirect_to '/create'
	  	end
  end

  def edit
  	@usuario = Usuario.find(params[:id])
  end

  def update
  	@usuario = Usuario.find(params[:id])
  	if @usuario.update(usuario_params)
      redirect_to @usuario
    else
      render :edit
    end
  end

  	private
  	def usuario_params
      params.require(:usuario).permit(:name, :apellido, :avatar)
    end

end
