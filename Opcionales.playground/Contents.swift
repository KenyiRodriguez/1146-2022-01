import UIKit

//***************** Variables Seguras ****************
/*
    * Una variable segura es aquella que no admite nulo en su valor
    * Es de cualquier tipo de dato
 */


//***************** Variables opcionales ****************
/*
    * SON VARIABLE QUE ADMITEN UN ERROR
            - Para Swift un nulo es un error
 
    * Una variable insegura es aquella que admite nulos en su valor
    * Es de cualquier tipo de dato
    * Tiene que tener una declaración EXPLÍCITA!!!
    * Para acceder al dato guardado, deber realizar un desempaquetado(unwrap) con el operador (??)
    * Cuando usamos la variable, no estamos usando el dato, estamos usando el puntero al dato.
 */

let n1: Int = 10
let n2: Int? = 15

let n2Seguro = n2 ?? 0

let suma = n1 + (n2 ?? 0)

print(n1)
print(n2)
print(n2Seguro)


func registrarConNombre(_ nombre: String?, apellido: String?) {
    
    let nombre = nombre ?? "No ingreso el nombre"
    let apellido = apellido ?? "No ingreso el apellido"
    
    let mensaje = """
    "El usuario registrado fue:"
    Nombre: \(nombre)
    Apellido: \(apellido)
    """
    
    print(mensaje)
}

registrarConNombre("Kenyi", apellido: nil)
