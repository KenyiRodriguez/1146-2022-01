import UIKit

//**************** FUNCIONES *******************
/*
    =======
    PARTES:
    =======
 
    * Se inicia con la palabra reserva "func"
    * El nombre del método o de la función
    * Los argumentos o parámetros de la función, los cuales son opcionales y van entre ()
    * El tipo de dato que retorna la función: ( -> TipoDato)
            - Esto es opcional si es del tipo Void
 
 
    ================================
    ARGUMENTOS DE ENVIO OBLIGATORIO:
    ================================
    Los agumentos constan de 3 partes principales:
 
    * Alias o descripción de la variable (_, descripción, nada)
            * El _ indica que la variable no tiene alias
            * Descripción indica que la variable tiene un alias
            * Nada indica que la variable se autodescribe y es su mismo alias
 
    * El nombre de la variable
    * El tipo de dato de la variable antepuesto por el símbolo ":"
 
 
 Ejemplo función:
 func nombreMetodo(Argumentos) -> Void { //Code here }
 func nombreMetodo(Argumentos) { //Code here }
 func nombreMetodo(Argumentos) -> Int { //Code here }
 
 Ejemplo Argumentos:
 (_ variable: TipoDato)
 (alias variable: TipoDato) *
 (variable: TipoDato) *
 
 
 pow(2,3) = 8? o 9?
 agregar("Fernando", "Mateo")
 
 */


//OFICIAL
func sumarNumero1(_ n1: Int, conNumero2 n2: Int) -> Int { n1 + n2 }
sumarNumero1(4, conNumero2: 9)


//RECOMENDADO
func sumar(numero1 n1: Int, conNumero2 n2: Int) -> Int { n1 + n2 }
sumar(numero1: 4, conNumero2: 7)

func sumar(numero1: Float, numero2: Float) -> Float { numero1 + numero2 }
sumar(numero1: 5, numero2: 8)



//ESTO NO VA... ESTO ES OBSOLETO, ESTO SE USA EN LOS 90's ES VIEJO!!!
func sumar(_ n1: Int, _ n2: Int) -> Int { n1 + n2 }
sumar(6, 10)

//LO QUE YO USO
func registrarUsuarioConNombre(_ nombre: String, conApellido apellido: String) { }
registrarUsuarioConNombre("Kenyi", conApellido: "Rodriguez")

func registrarUsuarioConNombre(_ nombre: String, apellido: String) { }
registrarUsuarioConNombre("Kenyi", apellido: "Rodriguez")
