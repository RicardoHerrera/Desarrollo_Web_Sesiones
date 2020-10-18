# Desarrollo_Web_Sesiones
_Sesiones virtuales de desarrollo web_

# Pasos para agregar bootstrap a un proyecto web con RoR:

1. Agregar bootstrap corriendo desde el terminal o CMD: 
    `yarn add bootstrap@4.3.1 jquery popper.js `
2. Agregar en el webpack/environment lo que vamos a usar(**config/webpack/environment**): 
``` const { environment } = require('@rails/webpacker') 
    const webpack = require("webpack") 
    environment.plugins.append("Provide", new webpack.ProvidePlugin({ 
        $: 'jquery', 
        jQuery: 'jquery', 
        Popper: ['popper.js', 'default'] 
    })) 
```
3. Agregar que vamos a usar el javascrip de bootstrap(**app/javascript/packs/application.js** ): 
	`import "bootstrap" `
4. Agregar que vamos a utilizar la hoja de estilo de bootstrap(**app/assets/stylesheets/application.css**): 
    `*= require bootstrap`

# Probar configuración

1. Ir a la raíz del proyecto
2. Ejecutar `rails s`