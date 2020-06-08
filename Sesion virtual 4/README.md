# Desarrollo_Web_Sesiones
_Sesión virtual 4 de desarrollo web_

# Validar formulario

* Ir a app -> views -> home -> index.html.erb y reemplazar el código con lo siguiente

```
<!DOCTYPE html>
<html lang="en">
    <head>
    </head>
    <body>
        <%= form_for :sesion4, :html => { :method => :post, :class => "needs-validation", :novalidate => "novalidate" },
        :url => { :controller => "home", :action => "mimetodo" } do |f| %>

        <div>
            <div class="row">
                <div class="col">
                    <div>
                        <%= f.label :nombre, 'Nombre' %>
                        <%= f.text_field :name, { :class => "form-control", :placeholder => "Ingresar nombres", 
                        :required => "required" } %>
                        <!-- Mostrar mensaje dependiendo si se encuentra o no-->
                        <div class="valid-feedback">Valido</div>
                        <div class="invalid-feedback">Por favor ingresar nombre</div>
                    </div>                                 
                </div>
                
                <div class="col">
                    <div>
                        <%= f.label :apellido, 'apellido' %>
                        <%= f.text_field :apellido, { :class => "form-control", :placeholder => "Ingresar apellido", 
                            :required => "required" } %>
                        <div class="invalid-feedback">Por favor ingresar apellido</div> 
                    </div> 
                </div>
            </div>
            <div>
                <div>
                    <%= f.label :dni, 'Dni' %>
                    <%= f.text_field :dni,  { :class => "form-control", :placeholder => "Ingresar DNI", 
                    :type => "number", :required => "required" } %>
                </div>
                <div class="invalid-feedback">Ingresar un dni valido</div>
            </div>
            <div>
                <%= f.label :email, 'Correo electrónico' %>
                <%= f.text_field :email, { :class => "form-control", :placeholder => "Ingresar correo",
                    :required => "required" } %>
            </div>
            <div>
                <%= f.label :verifyEmail, 'Verifica tu Correo' %>
                <%= f.text_field :verifyEmail, { :class => "form-control", :placeholder => "Confirmar correo",
                    :required => "required" } %>
                <div id="verifyEmailError"></div>
            </div>
            <div>
                <%= f.submit "Enviar", :class => "btn btn-primary" %>
            </div>
        </div>

        <% end %>
    </body>
</html>
```
Primero creamos un formulario y le pondemos un identificador `:sesion4`, luego le indicamos que va a ser de tipo post y que debe llamar al controlador ‘home’ y su método ‘mimetodo’. Se define la variable `|f|` que referencia al formulario. A continuación, se crean los campos en el formulario utilizando la variable f definida y el tipo deseado `f.text_input ..`
Nótese el class=”invalid-feedback”, esta se genera cuando las reglas del input no se cumplen, en este caso el `required => “required” ` Esto es parte de html, además se han puesto el nombre y el apellido como columnas para mostrarse en el formulario uno al lado del otro.

* Ir a app -> views -> layouts -> applications.html.erb y agregar estas líneas en el `<head></head>`

```
<script type="text/javascript">
      (function(){
        'use strict';
        window.addEventListener('load', function() {
          var forms = document.getElementsByClassName('needs-validation')
          var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
              if (form.checkValidity() == false) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false)
          });
        }, false)
      })();      
    </script>
```
Esto busca, en las vistas, los elementos con `class = “needs-validation”` como nuestro formulario anteriormente creado. Luego, va a verificar si las reglas de los campos se están cumpliendo al presionar un elemento ‘submit’, como en el caso de nuestro botón en el formulario. De no cumplirse estas reglas, detiene toda actividad con `preventDefault()` y luego evita que la información sea enviada con `stopPropagation()`

Esto les dará la validación básica en formularios para los campos requeridos. Se ha incluido un campo DNI que solo acepta números, sin embargo más adelante revisarán modelos para poder validar longitud de campos, comparación entre campos, etc. a través de Ruby.
