#language: es
Característica: Buscar un producto y enviarlo al carrito de compras
  Como   director de construcciones civiles
  Quiero buscar articulos para construccion via web en Alkomprar
  Para   adquirir productos a traves de un carrito de compras

  @Type_Test   @Tag_ID   @Tag_Requeriment   @Tag_Path  ... + @Tags
  Escenario: Busqueda de producto con envio al carrito
    Dado      abro la pagina web Alkomprar
    Cuando    busco el producto lo selecciono y envio al carrito de compras
    Entonces  deberia visualizar el carro de compras con el producto adicionado

Un feature tiene muchos escenarios
Evitar que sea demasiados escenarios, max 10
Cada escenario prueba un comportamiento
Cada escenario tiene una etiqueta localizador
Un escenario puede tener tantas etiquetas como necesite
Los escenarios están escritos de forma declarativa.
Evitar detalles incidentales dentro del escenario.
Omitir detalles obvios dentro del escenario.
Evitar pasos conjuntivos
Mantener escenarios cortos
Usar nombres de escenarios descriptivos
Tener solo un paso Cuándo
Usar el "debería" y sinonimos en los pasos Entonces

feature  	         Característica - Necesidad del negocio - Requisito
background	       Antecedentes
scenario	         Ejemplo - Escenario
scenarioOutline	   Esquema del escenario
examples	         Ejemplos
given	             Dado - Dada - Dados - Dadas
when	             Cuando
then	             Entonces
and	               * - Y - E
but	               Pero
rule	             Regla - Regla de negocio


@Automation
Feature: Product Login
    As a user, I would like to be able to use my credentials to successfully
    login.

    Rules:
    - The user must have a valid username
    - The user must have a valid password
    - The user must have an active subscription
    - User is locked out after 3 invalid attempts
    - User will get a generic error message following
      login attempt with invalid credentials

    Background: The user starts out on the login page
        Given the user is on the login page

    # Comentarios opcionales / optional comments
    @Tag_1
    Scenario: The user successfully logs in with valid credentials
        This scenario tests that a user is able to successfully login
        provided they enter a valid username, valid password, and
        currently have an active subscription on their account.

        When the user signs in with "valid" credentials
        Then the user should be logged in

    # Comentarios opcionales / optional comments
    @Tag_2
    Scenario: The user attempts to log in with invalid credentials
        This scenario tests that a user is not able to log in when
        they enter invalid credentials

        When the user signs in with "invalid" credentials
        Then the user should be logged in

    # Comentarios opcionales / optional comments
    @Production_Tag_3       --> solo se  ejecutara en entornos de produccion
    Scenario: The user is locked out after too many failed attempts
        This scenario validates that the user is locked out
        of their account after failing three consecutive
        attempts to log in

        When the user fails to log in 3 times
        Then the user should be locked out of their account

    # Comentarios opcionales / optional comments
    @Staging_Tag_4         --> son cuentas provisionales y no funcionarán en los otros entornos
    Scenario Outline: The user successfully logs in with their account
         This scenario outlines tests in which various users attempt
         to sign in successfully

         When the user enters their <username>
         And the user enters their <password>
         Then the user should be successfully logged on

         Examples:
         | username    | password   |
         | rassiya     | 1234       |
         | deutschland | 4321       |
         | sbrja       | 6721       |
         | españa      | 690321     |
         | mejico      | 487321     |        


************************************************************************************************

    Antecedentes:
      Dado el usuario abre la web "http ....."
      Y  ...

    @Another_Tag_Example_Success
    Escenario: Iniciar sesión con exito.
      Cuando el usuario ingresa <username> y la contraseña <password>
      Entonces el usuario visualizaria el mensaje <message>
          | username | password | message |
          | payaso   | 123456  | mensaje |
      


    @Another_Tag_Example_Failed
    Escenario: Iniciar sesión sin exito.
      Cuando el usuario ingresa el <username> y la contraseña <password>
          | username | password |
          | payaso   | 123456777  |
      Entonces el usuario visualizaria el mensaje "...."

************************************************************************************************

Scenario Outline: Steps will run conditionally if tagged
  Given user is logged in
  When user clicks <link>
  Then user will be logged out

  @mobile
  Examples:
    | link                  |
    | logout link on mobile |

  @desktop
  Examples:
    | link                   |
    | logout link on desktop |



    and not || not || and || or

Ejecute escenarios con una etiqueta en particular
    @CucumberOptions(tags = "@mobile and @desktop")
    public class RunCucumberTest {}

Ignorar escenarios con una etiqueta en particula
    @CucumberOptions(tags = "not @mobile")
    public class RunCucumberTest {}


cucumber.ansi-colors.disabled=  # true or false. default: false
cucumber.execution.dry-run=     # true or false. default: false
cucumber.execution.limit=       # number of scenarios to execute (CLI only).
cucumber.execution.order=       # lexical, reverse, random or random:[seed] (CLI only). default: lexical
cucumber.execution.wip=         # true or false. default: false.
cucumber.features=              # comma separated paths to feature files. example: path/to/example.feature, path/to/other.feature
cucumber.filter.name=           # regex. example: .*Hello.*
cucumber.filter.tags=           # tag expression. example: @smoke and not @slow
cucumber.glue=                  # comma separated package names. example: com.example.glue
cucumber.plugin=                # comma separated plugin strings. example: pretty, json:path/to/report.json
cucumber.object-factory=        # object factory class name. example: com.example.MyObjectFactory
cucumber.snippet-type=          # underscore or camelcase. default: underscore
