import UIKit

let informacion1 = ("Kenyi", "Rodriguez")
informacion1.0
informacion1.1

let informacion2 = (nombre: "Kenyi", apellido: "Rodriguez")
informacion2.nombre
informacion2.apellido

let informacion3: (nombre: String, apellido: String, edad: Int) = ("Kenyi", "Rodriguez", 32)
informacion3.nombre
informacion3.apellido


typealias Persona = (nombre: String, apellido: String, edad: Int)

let informacion4: Persona = ("Kenyi", "Rodriguez", 3)
informacion4.nombre
informacion4.apellido


typealias Operaciones = (suma: Double, resta: Double, producto: Double, division: Double)

func operar(n1: Double, n2: Double) -> Operaciones {
    let suma = n1 + n2
    let resta = n1 - n2
    let producto = n1 * n2
    let div = n1 / n2
    
    return (suma, resta, producto, div)
}

let resultado = operar(n1: 6, n2: 4)
resultado.suma
resultado.resta
resultado.producto
resultado.division
