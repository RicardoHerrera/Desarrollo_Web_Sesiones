# Add image using carrierwave

**NOTA:**
	Para este ejemplo se utilizará un proyecto rails ya existente con una base de datos y una tabla usuario

## Importar la gema

Desde el CMD o terminal, ejecutar 
`gem install carrierwave`
Luego, dirigirse a la carpeta Gemfile y agregar la gema
`gem 'carrierwave', '~> 2.0'`
Por último, estando en la raíz del proyecto, ejecutar bundle install para actualizar el proyecto
`bundle install`

## Crear el archivo uploader

Este archivo será el encargado de manejar la imagen utilizando la librearía antes importada, para el presente ejemplo crearemos un manejador para el avatar del usuario, por lo cual se ejecuta
`rails generate uploader Avatar`

## Revisar archivo generado

Como se indicó anteriormente, el comando generará un archivo en la siguiente dirección **app/uploaders/avatar_uploader.rb** aquí encontrarán comentarios y código generado que explica su funcionamiento.

## Modificar la tabla

Para soportar el avatar nuevo que queremos utilizar, debemos actualizar la tabla actual que tenemos. Para esto tienen dos opciones

1. Ir directamente a la base de datos y crear la nueva columna en la tabla usuario con nombre `avatar` y de tipo varchar
2. Crear un archivo de migración para actualizar la tabla con lo mencionado anteriormente.

Para el presente ejemplo utilizaremos la opción 2, para esto alteraremos la tabla Usuarios y agregaremos un campo avatar de tipo string. Ejecutar

`rails g migration add_avatar_to_usuarios avatar:string`
y luego ejecutamos el archivo creado
`rails db:migrate`

## Modificar el modelo

Ahora, debemos hacer que rails utilice este nuevo campo y lo relacione al Avatar uploader que creamos previamente. Para esto nos dirigimos a nuestro modelo usuario.erb y agregamos
`mount_uploader :avatar, AvatarUploader`

Nuestro modelo quedaría así:
```
class Usuario < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
end
```

# Modificar las vistas

Ahora, debemos agregar el campo para buscar un archivo al momento de crear y de actualizar un usuario.

Para esto, en nuestro formulario de editar agregar para ver la imagen si el usuario tiene guardado una:
  `<%= image_tag(@usuario.avatar.url, style: 'height:auto;width:300px;', alt: 'Avatar') if @usuario.avatar? %><br>`
 y Agregamos la opción de buscar archivos, pero solamente imagenes
  `<%= f.file_field :avatar, accept:'image/*' %><br><br>`
En la vista de crear, solo agregamos el campo  para buscar la imagen.

También debemos agregar la opción de mostrar la imagen al momento de visualizar el usuario
En la vista show solo agregamos la muestra de imagen si el usuario tiene asignado uno
`<%= image_tag(@usuario.avatar.url, style: 'height:auto;width:300px;', alt: 'Avatar') if @usuario.avatar? %><br>`

# Modificar Controlador
Ya tenemos lista la vista y la base de datos para poder recibir una imagen para el usuario, ahora debemos actualizar nuestros métodos en el controlador para poder crear y actualizar.

Para esto depende de cómo hemos hecho los métodos, pero principalmente es agregar el nuevo campo de la base de datos y agregar el nuevo campo :avatar. En este caso lo haremos utilizando el método creado usuario_params donde agregamos el campo y luego lo utilizamos en el método:
```
private
  	def usuario_params
      params.require(:usuario).permit(:name, :apellido, :avatar)
    end
```
```
def update
  	@usuario = Usuario.find(params[:id])
  	if @usuario.update(usuario_params)
      redirect_to @usuario
    else
      render :edit
    end
  end
 ```

# Notas finales

Con esto ya tenemos un sistema donde podemos crear y actualizar un usuario con su avatar, en el código  le he puesto un tamaño fijo,  en el controller he utilizado ambas formas de utilizar los fields delformulario.

Referencia: [carrierwave Official Github page](https://github.com/carrierwaveuploader/carrierwave "carrierwave's Homepage")