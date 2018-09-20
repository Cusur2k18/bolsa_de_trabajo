# **Bolsa de Trabajo.**

#### _Importante: Se recomienda visualizar éste documento con el visor de markdown de VSCode o Atom_

## Tabla de contenidos: 
1. [Software y requerimientos](##software-y-requerimientos).
    - [Descripción general](###descripcion-general).
    - [Versiones de ruby y gemas](###Versión-de-Ruby,-gemas-y-dependencias).
    - [Instalación para desarrollo](###Instalación-de-Rails-para-desarrollo).
    - [Instalación del proyecto](###Instalación-del-proyecto.).
2. [Guía de directorios del proyecto](##Guía-de-directorios-del-proyecto)
    - [El directorio `app/`](###El-directorio-`app/`).
    v [El directorio `config/`](###El-directorio-`config/`).
    - [El directoriob`db/`](###El-directorio-`db/`).
3. [Descripción de los modelos y controladores](###Descripción-de-los-modelos-y-controladores).
4. [Documentación base](###Documentación-base).
5. [Diagrama de la base de datos](###Diagrama-de-la-base-de-datos).
6. [Información adicinonal](###Información-adicional).


## **Software y requerimientos.**
### **Descripcion general.**
 La aplicación "Bolsa de trabajo" está hecha con [Ruby on Rails 5.1](https://rubyonrails.org), que fue la versión más actualizada a la fecha de realización de la aplicación.


### **Versión de Ruby, gemas y dependencias.**
- `Ruby 2.5.1p57 [x86_x64]`.
- `Rails 5.1.4` (Probado también con Rails 5.1.6 y funcional).
- Las versiones de las gemas se pueden ver en el archivo `Gemfile.lock` y `Gemfile` tenga en cuenta que algunas gemas se pueden llegar a actualizar dependiendo de cuando se instale el proyecto nuevamente. 
- Rails requiere:
    - [NodeJS](https://nodejs.org/es/download/).
    - [Git](https://git-scm.com/), la mayoria de distribuciones de Linux tienen instalado Git por defecto, tal vez se requiera  instalar en MacOS, se requiere instalar en Windows.
    - [Curl](https://git-scm.com/).
    - Herramientas de desarrollo de C `gcc` y `gcc-dev`. 
- Nokogiri requiere los siguientes paquetes dependiendo de la distribución de Linux.
    - Ubuntu/Debian: `build-essential patch ruby-dev zlib1g-dev liblzma-dev`.
    - Redhat/CentOS: `gcc ruby-devel zlib-devel`.
### **Instalación de Rails para desarrollo.**
Para instalar la aplicación se pueden usar 3 métodos distintos:
- [RVM](https://rvm.io/rvm/install).
- [Rails Dev Box](https://github.com/rails/rails-dev-box).
- [Rbenv](https://github.com/rbenv/rbenv).

El más recomendable sería RVM ya que se pueden instalar muchas versiones de Ruby/Rails en un solo sistema.

### **Instalación del proyecto.**
Después de haber instalado correctamente rails, el mismo se puede probar de la siguiente manera:

Crear una nueva aplicación de rails:

`$ rails new app`

Moverse al directorio de la nueva aplicación:

`$ cd app`

Instalar todas las gemas requeridas:

`$ bundle install`

Iniciar el servidor web rails:

`$ rails s`

Si hay algún error en dependencias el comando `$ bundle install` lo notificará, también dará algunas recomendaciones para solucionar el problema.

Para correr el proyecto, después de clonarlo:

`$ cd bolsa_de_trabajo`

`$ rails s`

Correr las migraciones de la base de datos:

`$ rails db:migrate`

**Nota:**  El comando de las migraciones sólo se debe de correr la primera vez que se instale el proyecto, a menos que se agreguen más migraciones en el futuro.

Después de esto ir a la dirección `localhost:3000` en algún navegador web y mostrará la página principal de la aplicación.

### **Otras recomendaciones.**
Los editores usados durante el desarrollo fueron:
- VisualStudio Code con las extensiones:
    - `Ruby`.
    - `Simple Ruby ERB`.
    - `Vim`.
- VIM y gVIM con los plugins:
    - `Plug` para manejar plugins.
    - `NerdTree` para manejar directorios.
    - `Emmet` para HTML.
    - `indenthtml` para indentación y formato de HTML.

Claro está que esto es meramente preferencial.

## **Guía de directorios del proyecto**
Rails usa el modelo [MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) así que es recomendable leer sobre ese modelo antes de empezar a desarrollar.

Una aplicación de Rails está compuesta por los siguientes directorios:
- `app`
- `bin`
- `config`
- `deb`
- `log`
- `public`
- `test`
- `tmp`
- `vendor`

Los directorios de interés en éste proyecto son:
- `app`
- `config`
- `db`

### **El directorio `app/`** 

En el directorio `app/` se encuentran los recursos CSS,JavaScripts, generador de PDFs, imágenes además de los modelos, controladores y vistas.

#### Subdirectorio **`app/assets`**
- Los archivos CSS están bajo `app/assets/stylesheets/`.
- Los archivos JS están bajo `app/assets/javascripts/`, el tipo de JavaScript utilizado es [CoffeeScript](https://coffeescript.org/).
- Los logos, e imágenes usados estan bajo `app/assets/images/`.

  Los archivos `.scss` como los `.coffee` comparten el nombre de la vista, el `.scss` global es llamado `application.scss`

#### **Subdirectorio `app/controllers`**
En éste directorio se encuentra la mayoría de la lógica de la aplicación.

#### **Subdirecotrio `app/models`**
En éste subdirectorio se encuentran como su nombre lo dice contiene los modelos. Los modelos contienen la estructura de las relaciones de la base de datos, declaración de tipo de dato `enum` además de validación a nivel de base de datos.

#### **Subdirectorio `app/pdfs`**
En la carpeta pdfs se encuentran las estructuras de como se generan los PDFs.

**Nota:** ésta carpeta ni sus contenidos fueron generada automáticamente por Rails

####  **Subdirectorio `app/views`**
Éste directorio contiene la vistas de la aplicación, algunas carpetas tienen directorios llamados `partials`, los `partials` se utilizan para renderizar vistas en otra vista. Cabe mencionar también que las vistas serán archivos `html.erb` lo cual permite a `rails` utilizar código de `ruby` en los archivos `html` mediante el tag `<% %>` si no se quiere mostrar el resultado o el tag `<%= %>` si se quiere imprimir en pantalla el resultado.

Por ejemplo:

**Input:**

    <% i = 1 %>

    El primer tag no muestra el resultado del código <% puts i %>

    <% i = 2 %>

    El segundo tag si muestra el resultado del código <%= puts i %>

 **Output:**

    El primer tag no muestra el resultado del código

    El segundo tag si muestra el resultado del código 2


### **El directorio `config/`**

- `routes.rb` aquí se encuentran todas las rutas de la aplicación. De igual manera se pueden visualizar todas las rutas de la aplicación con el comando:

    ` $ rails routes`

- `locales/` en ésta carpeta están los archivos de localización de la aplicación.


### **El directorio `db/`**
En el directorio `db/`se guarda la estructura de la base de datos además de las migraciones.
- `migrate/` aquí se encuentran todas las migraciones, las migraciones están compuestas por la fecha en que se genero, un guión bajo y el nombre de la migración. Se pueden visualizar de una manera más amigable las migraciones mediante el comando 

    `$ rails db:migrate:status`
- `schema.rb` guarda un esquema de la base de datos, aquí se pueden visualizar todas las tablas con sus tipos de datos.
- `seeds.rb` aquí se pueden generar datos para poblar la base de datos.


### **Archivos importantes**
- `Gemfile.lock` este archivo es generato automáticamente no se debe de editar.
- `Gemfile` en éste archivo se pueden agregar gemas para el proyecto, por lo general la documentación oficial de dicha gema tendrá instrucciones para su instalación.

### **Descripción de los modelos y controladores**
En ésta sección se dará una breve descripción de los modelos y los controladores de todo el proyecto, ésta sección va de la mano con el diagrama de la base de datos.
Cabe recordar que las vistas comparten el mismo nombre que los controladores.

**Modelos** 
- `academic_awards.rb` premios académicos de `Student`.
- `address.rb` domicilio de `User`.
- `admin.rb` administradores.
- `application_record.rb` generado automáticamente por rails.
- `company.rb` empresas.
- `course.rb` cursos realizados por `Student`.
- `education.rb` carreras cursadas por `Student`.
- `former_job.rb` trabajos anteriores de `Student`.
- `interview` entrevista creada por `Company` que pertenece a  `Job` y `Student`.
- `job_application` aplicación a un `Job` creada por `Student`.
- `job_type`clasificación de `Job` creada por `Admin`, pertenece a `Job`.
- `language` lenguajes dominados por `Student`.
- `phone_number.rb` números telefónicos de `User`.
- `student.rb` estudiantes.
- `user.rb` `User` generado por [Devise](https://github.com/plataformatec/devise)

Para lograr el sistema de single log in para multiple tipos de `User` se usa una relación polimórfica entre `User`, `Company` y `Student`, toda la información sobre ésta relación se encuentra en sus respectivos modelos.

### **Documentación base**
La documentación de referencia que se utilizó antes de empezar a desarrollar se encuentra bajo el directorio `documentation/`

### **Diagrama de la base de datos**
El diagrama de la base de datos se encuentra en el directorio `documentation/` y fue generado automáticamente con `rails-erd`. Si se requiere generar un diagrama nuevo tras alguna modificación se recomienda leer la [documentacion](https://voormedia.github.io/rails-erd/install.html) de dicha gema.

### **Información adicional**
1. Para poder hacer funcionar los turbolinks con JavaScript y JQuery es necesario decirle a turbolinks que se va a cargar un archivo
mediante `$(document).on('turbolinks:load', ready)`. Visitar la [documentación](https://github.com/turbolinks/turbolinks) para entender por que es necesario ésto.

2. Los datos de registro de `User` son manejados por devise así que sus controladores no estan en `app/controllers`.

3. Los modelos son muy simples así que no estan comentados individualmente. Si se quiere saber más sobre los métodos utilizados en los mismos revisar:
    - [Asociaciones](https://guides.rubyonrails.org/association_basics.html).
    - [Modelos](https://guides.rubyonrails.org/active_model_basics.html).
    - [ENUM](https://api.rubyonrails.org/v5.1/classes/ActiveRecord/Enum.html).

4. Las vistas generan una carpeta por nombre de controlador, y cada método de controlador puede tener una vista. Revisar la documentación de [vistas](https://guides.rubyonrails.org/action_view_overview.html) si se requiere más información.